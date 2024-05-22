defmodule PracphoenixWeb.OfferCon do
  alias Pracphoenix.Offers
  alias Pracphoenix.Offers.Offer

  use PracphoenixWeb, :live_view
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Offers.subscribe()
    end
    offers = Offers.list_offers()
    changeset = Offers.change_offer(%Offer{})
    {:ok, assign(socket, offers: offers, form: to_form(changeset),num_offer: length(offers),search: "", search_result: [])}
  end
  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-7xl px-8 pt-8'">
    <section>
        <header class=' '>
          <div class='rounded-3xl bg-gradient-to-tr from-[#4584b6] via-[#4584b6] to-sky-300 p-8 lg:px-20 lg:py-32'>
            <div class='mx-auto max-w-xl text-center'>
              <span class='relative rounded-full bg-white/10 px-4 py-2 text-sm leading-6 text-white ring-1 ring-white/20'>
                Pythondevs
              </span>
              <h2 class='font-display mt-8 text-balance text-3xl font-light tracking-tight text-white lg:text-4xl'>
                Premier Python Developer Jobs
              </h2>
              <p class='mt-4 text-balance text-base text-slate-300'>
                Pythondevs is a handpicked job platform showcasing premier
                opportunities for python developers within
                the tech industry.
              </p>
            </div>
          </div>
        </header>
        <div class='mx-auto max-w-7xl px-8 lg:px-0'>
          <div class='mx-auto max-w-7xl py-6 md:px-32 lg:-mt-24'>
             <.form phx-submit="search" class='mx-auto mt-4 rounded-2xl bg-white/20 p-4 shadow-2xl shadow-slate-500/40 backdrop-blur-xl lg:p-8'>
              <div class='grid grid-cols-1 gap-2 md:grid-cols-2 lg:grid-cols-1'>
                <div>
                  <div class='relative flex items-center justify-start w-'>
                    <input
                      class='block w-full rounded-lg border-0 border-slate-300 px-4 py-2.5 pl-4 pr-8 text-left leading-none text-slate-500 shadow shadow-slate-500/20 outline-none ring-1 ring-inset ring-slate-300 duration-200 focus:ring-2 focus:ring-purple-600 sm:text-sm sm:leading-6 lg:rounded-xl'
                      type='text'
                      placeholder='Search...'
                      value={@search}
                      phx-debounce='500'

                    />
                    <svg
                      class='absolute right-3 z-10 cursor-pointer'
                      width='20'
                      height='20'
                      viewBox='0 0 24 24'
                      fill='none'
                      xmlns='http://www.w3.org/2000/svg'
                    >
                      <path
                        d='M10 17C13.866 17 17 13.866 17 10C17 6.13401 13.866 3 10 3C6.13401 3 3 6.13401 3 10C3 13.866 6.13401 17 10 17Z'
                        stroke='#6b7280'
                        stroke-width='1.66667'
                        stroke-linecap='round'
                        stroke-linejoin='round'
                      ></path>
                      <path
                        d='M21 21L15 15'
                        stroke='#6b7280'
                        stroke-width='1.66667'
                        stroke-linecap='round'
                        stroke-linejoin='round'
                      ></path>
                    </svg>
                  </div>
                </div>



              </div>
            </.form>
          </div>
        </div>
      </section>

    <li :for={searches <- @search_result} class="bg-gradient-to-br from-teal-100 via-blue-900 to-red-400 ">
    <%= searches.course %>
    </li>
    <div
    x-data="{ 'showModal': false }"
    @keydown.escape="showModal = false"
    >
    <!-- Trigger for Modal -->
    <button type="button" @click="showModal = true">Open Modal</button>

    <!-- Modal -->
    <div
        class="fixed inset-0 z-30 flex items-center justify-center overflow-auto bg-black bg-opacity-50 backdrop-blur-sm"
        x-show="showModal"
    >
        <!-- Modal inner -->
        <div
            class="max-w-7xl px-6 py-4 mx-auto text-left bg-white rounded shadow-lg"
            @click.away="showModal = false"
            x-transition:enter="motion-safe:ease-out duration-300"
            x-transition:enter-start="opacity-0 scale-90"
            x-transition:enter-end="opacity-100 scale-100"
        >
            <!-- Title / Close-->
            <div class="flex items-center justify-between">
                <h5 class="mr-3 text-black max-w-none">Title</h5>

                <button type="button" class="z-50 cursor-pointer" @click="showModal = false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
            </div>

            <!-- content -->
            <div>
            <.form for={@form} phx-change="validate"  phx-submit="save" >
    <.input  field={@form[:uni]}   />
    <.input field={@form[:course]}  />
    <.button phx-disable-with="Loading..." >Save</.button>
    </.form>
            </div>
        </div>
    </div>
    </div>


    <h1>Number of offers: <%= @num_offer%></h1>
    <div :for={offer <- @offers} id={"offer-#{offer.id}"} class={"rounded-3xl border border-gray-200 text-white p-2 shadow-sm dark:border-gray-700 bg-sky-600  mx-auto max-w-4xl my-3"}>
            <div class="space-y-0 md:flex md:items-center md:justify-between md:gap-6 md:space-y-0">
              <a href="#" class="shrink-0 md:order-1">
                <img class="h-20 w-20 dark:hidden" src="https://remoteok.com/cdn-cgi/image/format=auto,fit=contain,width=100,height=100,quality=50/https://remoteOK.com/assets/img/jobs/391ae6861ee707daca108f7c9de1635b1716368275.png?1716368276" alt="imac image" />
                <img class="hidden h-20 w-20 dark:block" src="https://remoteok.com/cdn-cgi/image/format=auto,fit=contain,width=100,height=100,quality=50/https://remoteOK.com/assets/img/jobs/391ae6861ee707daca108f7c9de1635b1716368275.png?1716368276" alt="imac image" />
              </a>

              <label for="counter-input" class="sr-only">Choose quantity:</label>
              <div class="flex items-center justify-between md:order-3 md:justify-end">
                <div class="flex items-center">
                  <button type="button" id="decrement-button-2" data-input-counter-decrement="counter-input-2" class="inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-md border border-gray-300 bg-gray-100 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-100 dark:border-gray-600 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700">
                    <svg class="h-2.5 w-2.5 text-gray-900 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 2">
                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h16" />
                    </svg>
                  </button>
                  <input type="text" id="counter-input-2" data-input-counter class="w-10 shrink-0 border-0 bg-transparent text-center text-sm font-medium text-gray-900 focus:outline-none focus:ring-0 dark:text-white" placeholder="" value="1" required />
                  <button type="button" id="increment-button-2" data-input-counter-increment="counter-input-2" class="inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-md border border-gray-300 bg-gray-100 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-100 dark:border-gray-600 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700">
                    <svg class="h-2.5 w-2.5 text-gray-900 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16" />
                    </svg>
                  </button>
                </div>
                <div class="text-end md:order-4 md:w-32">
                  <p class="text-base font-bold text-gray-900 dark:text-white">$598</p>
                </div>
              </div>

              <div class="w-full min-w-0 flex-1  md:order-2 md:max-w-md">
                <a href="#" class="text-base font-bold text-white hover:underline dark:text-white">
                <%= offer.course %>
                </a>
                <p class="text-sm text-gray-200 dark:text-gray-400">
                  <%= offer.uni %>
                </p>

                <div class="flex items-center gap-4">
                  <button type="button" class="inline-flex items-center text-sm font-medium text-gray-500 hover:text-gray-900 hover:underline dark:text-gray-400 dark:hover:text-white">
                    <img class="h-5 w-5" src="https://remoteok.com/assets/hot2x.gif" alt="heart icon" />
                  </button>

                  <button type="button" class="inline-flex items-center text-sm font-medium text-red-600 hover:underline dark:text-red-500">
                   <img class="h-5 w-5" src="https://remoteok.com/assets/new2x.gif" alt="trash icon" />
                  </button>
                </div>
              </div>
            </div>
          </div>
    </div>
    """
  end




def handle_event("save", %{"offer" => offer_params}, socket) do
  IO.inspect(offer_params)
  case Offers.create_offer(offer_params) do
    {:ok, offer} ->
      socket =
        update(
      socket,
      :offers,
      fn offers -> [offer | offers] end
    )
      {:noreply, assign(socket, form: to_form(Offers.change_offer(%Offer{})))}
    {:error, changeset} ->
      {:noreply, assign(socket, changeset: to_form(changeset))}
  end
end

def handle_event("search", %{"search" => search}, socket) do
  search_result = Offers.search_offers(search)
  IO.inspect(search_result)
  {:noreply, assign(socket,search: search, search_result: search_result)}
end

def handle_event("validate", %{"offer" => offer_params}, socket) do
  changeset =
    %Offer{}
    |> Offers.change_offer(offer_params)
    |> Map.put(:action, :insert)

  {:noreply, assign(socket, form: to_form(changeset))}

end

def handle_info({:new_offer,offer}, socket) do
  socket =
    update(
      socket,
      :num_offer,
      fn num_offer -> num_offer + 1  end

    )
  socket =
    update(
      socket,
      :offers,
      fn offers -> [offer | offers] end
    )
  {:noreply, socket}

end

end
