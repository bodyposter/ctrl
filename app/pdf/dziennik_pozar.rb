class DziennikPozar < Prawn::Document
  def initialize(osoba, szkol)
  	super()
  	@osoba = osoba
    @szkolenie = szkol
      self.font_families.update("Geogrotesque"=>{:normal =>"app/assets/fonts/Geogrotesque-Rg.ttf",
      											 :bold =>"app/assets/fonts/Geogrotesque-Sb.ttf"})
    font "Geogrotesque"  
    @data = @szkolenie.created_at.strftime("%d.%m.%Y")
    @data1 = @szkolenie.created_at.strftime(".%m.%Y")
    @data2 = @szkolenie.created_at.strftime("/%Y")
    @data_od = @szkolenie.data_od.strftime("%d.%m.%Y")
    @data_do = @szkolenie.data_do.strftime("%d.%m.%Y")
    @ilosc_dni = (@szkolenie.data_do - @szkolenie.data_od).to_i
    
    if @ilosc_dni <= 0
    	@dni = ""
    else
    	@dni = @ilosc_dni
    end 
    
    firma
    nr_kursu
    head
	dane_kursu
	tabela
	next_page
	tekst
	tabela2
	podsumowanie
	organizator


  end

  def osoby
  	@osoba.each do |osoba| 
      text "#{osoba.osoba_imie} #{osoba.osoba_nazwisko}"
    end
  end

  def firma
	bounding_box([30, 700], :width => 200, :height => 75) do

		text "Firma:", size: 16, :align => :left, style: :bold
		text "#{@szkolenie.firma}", size: 14, :align => :left, style: :normal, :overflow => :shrink_to_fit
	end
  end

  def nr_kursu
	bounding_box([450, 700], :width => 75, :height => 75) do

		text "NR KURSU:", size: 16, :align => :center, style: :bold
		stroke_rectangle [7, 58], 80, 20
		text_box "#{@szkolenie.szkolenie_id}#{@data2}",:at => [7, 55], :align => :center, size: 14, style: :bold
	
	end
  end

  def head
  		move_down 5
  		text "DZIENNIK SZKOLENIA", size: 24, :align => :center, style: :bold
 		move_down 5
  	
  end

  def dane_kursu
	bounding_box([50, 570], :width => 430, :height => 120) do
	stroke_bounds
		move_down 5
		text "SZKOLENIE Z ZAKRESU OCHRONY PRZECIWPOŻAROWEJ ", size: 20, :align => :center, style: :bold
  		move_down 15
		
		bounding_box([0, 40], :width => 430, :height => 40) do
		stroke_bounds
		move_down 10
		text "Czas trwania kursu od: #{@data_od} r. do #{@data_do} r.", :align => :center, size: 14
		end

	end
  end

  def tabela
  	move_down 20
  	text "Program szkolenia:", size: 14, :indent_paragraphs => 50

	bounding_box([50, 400], :width => 450, :height => 450) do
	
		table tabela_zaw do
		row(0).font_style = :bold
		row(0).columns(1..2).align = :center
		row(1..10).columns(2).align = :center
		end

	end
end

def tabela_zaw
	[["Lp","Tematyka szkolenia"],
	["1.", "Przepisy przeciwpożarowe dotyczące ochrony ppoż. budynków."],
	["2.", "Współpraca zakładów pracy z PSP."],
    ["3.", "Zasady organizacji zakładowego systemu ochrony ppoż."],
    ["4.", "Zagrożenia pożarowe obiektu oraz przyczyny powstawania i rozprzestrzeniania się pożaru.
"],
	["5.","Znaki ewakuacyjne oraz przeciwpożarowe."],
	["6.", "Systemy oraz sprzęt ochrony ppoż. "],
	["7.", "Postępowanie na wypadek powstania pożaru."],
	["8.", "Ogólne zasady postępowania w sytuacjach nadzwyczajnych / kataklizm/zamach terrorystyczny."],
	["9.", "Sposoby ewakuacji ludzi i mienia na wypadek powstania pożaru oraz sposoby postępowania do czasu przybycia jednostek ratowniczo - gaśniczych."],
	["10.", "Rozmieszczenie i obsługa stałych urządzeń gaśniczych oraz podręcznego sprzętu gaśniczego"],
	["11.", "Pierwsza pomoc przy poparzeniach i zatruciach gazami."]]
end

def next_page
	start_new_page
end

def stopka
move_down 150

   	text "1) Wpisać nazwę formy szkolenia zgodnie z § 13 ust. 1 oraz § 15 ust. 1 i 2 rozporządzenia Ministra Gospodarki i Pracy z dnia 27 lipca 2004 r. ", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 30
	text "w sprawie szkolenia w dziedzinie bezpieczeństwa i higieny pracy (Dz. U. Nr 180, poz. 1860, z późn. zm.).", :align => :justify, size: 8, :color => "9e9e9e", :indent_paragraphs => 30
end

def tekst
	text "UCZESTNICY SZKOLENIA:", :align => :left, size: 16, :indent_paragraphs => 50, style: :bold
end

def tabela2

	ilosc = @osoba.count
	@wysokosc = 40 + 25*ilosc

		table uczestnicy, :position => :center do
		row(0).font_style = :bold
		row(1..ilosc).columns(0..2).size = 10
		row(0).columns(1).width = 200
		row(0).columns(2).width = 114
		cells.align = :center
		self.header = true
		end


end

def uczestnicy
	
	[["Lp","Nazwisko i imię","Numer zaświadczenia"]] +
	@osoba.map.with_index do |osoba, index|
		[index + 1, "#{osoba.osoba_nazwisko} #{osoba.osoba_imie}", "#{osoba.nr_zaswiadczenia}/PPOŻ/#{@szkolenie.szkolenie_id}#{@data2}"]		
	end

end

def podsumowanie
	move_down 25
	text "SPRAWOZDANIE Z KURSU:", :align => :left, size: 16, :indent_paragraphs => 50, style: :bold
	ilosc = @osoba.count
	wysokosc = 30 + 25*ilosc
	@wys = 680 - wysokosc - 40

			table podsumowanie_tabela, :position => :center do
			row(0..2).font_style = :bold
			row(0..2).size = 11
			cells.align = :center
			self.header = true
			end
end

def podsumowanie_tabela

		[[{:content => "Czas trwania", :colspan => 2}, {:content => "Liczba", :colspan => 2}, {:content => "Liczba uczestników", :colspan => 2}, "Liczba wyd. zaśw.", "Uwagi"],
		["OD","DO","DNI","GODZIN","Rozpoczynających", "Kończących","",""],
		["#{@data_od}","#{@data_do}","#{@dni}","3", "#{@osoba.count}","#{@osoba.count}","#{@osoba.count}", "" ]]
	
end

def organizator
	move_down 30
		text "ORGANIZATOR:", :align => :left, size: 16, :indent_paragraphs => 50, style: :bold
		text "KURSU:", :align => :left, size: 16, :indent_paragraphs => 77, style: :bold
	move_down 40
		text "______________", :align => :left, size: 16, :indent_paragraphs => 50, style: :bold

end




end

