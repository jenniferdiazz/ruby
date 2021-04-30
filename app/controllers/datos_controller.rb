

class DatosController < ApplicationController
  before_action :set_dato, only: %i[ show edit update destroy ]

  # GET /datos or /datos.json
  def index
   
    id='BTC-CLP'

    
    resp = HTTParty.get "https://www.buda.com/api/v2/markets/#{id}/trades",
query:{
"limit" => 100,


  }

 resp= resp["trades"]
 array = []
 resp["entries"].each do |elemento|
  #puts elemento[2], "|"
  array.push(elemento[2])
end

@precio = array.max { |a, b| a<=>b} 
#array.each do |elemento|
  #puts elemento[2], "|"
#end

 
 
  @datos= resp
  @id2='BTC-CLP'

#@datos = HTTParty.get "https://ajayakv-rest-countries-v1.p.rapidapi.com/rest/v1/all",
#headers:{
#"x-rapidapi-key" => '271bc37308msh87b9fbc58ccfafdp1465d6jsn5f3e480e0da9',
#"x-rapidapi-host" => 'ajayakv-rest-countries-v1.p.rapidapi.com'

#  }

  end

  # GET /datos/1 or /datos/1.json
  def show
  end

  # GET /datos/new
  def new
    @dato = Dato.new
  end

  # GET /datos/1/edit
  def edit
  end

  # POST /datos or /datos.json
  def create
    @dato = Dato.new(dato_params)

    respond_to do |format|
      if @dato.save
        format.html { redirect_to @dato, notice: "Dato was successfully created." }
        format.json { render :show, status: :created, location: @dato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datos/1 or /datos/1.json
  def update
    respond_to do |format|
      if @dato.update(dato_params)
        format.html { redirect_to @dato, notice: "Dato was successfully updated." }
        format.json { render :show, status: :ok, location: @dato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datos/1 or /datos/1.json
  def destroy
    @dato.destroy
    respond_to do |format|
      format.html { redirect_to datos_url, notice: "Dato was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dato
      @dato = Dato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dato_params
      params.require(:dato).permit(:dato1)
    end
end
