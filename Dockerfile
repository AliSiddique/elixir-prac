# Use the official Elixir image as the base
FROM elixir:1.12.3

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Install inotify-tools for file system watching
RUN apt-get install -y inotify-tools

# Set the working directory inside the container
WORKDIR /app

# Install hex package manager and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Install Phoenix framework
RUN mix archive.install hex phx_new 1.6.0 --force

# Copy the mix.exs and mix.lock files to install dependencies
COPY mix.* ./

# Install dependencies
RUN mix deps.get

# Copy the rest of the application code
COPY . .

# Compile the application
RUN mix compile

# Expose the Phoenix port
EXPOSE 4000

# Set the environment variables
ENV MIX_ENV=prod

# Run the Phoenix server
CMD ["mix", "phx.server"]
