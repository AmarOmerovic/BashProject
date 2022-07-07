#                             Online Bash Shell.
#                 Code, Compile, Run and Debug Bash script online.
# Write your code in this editor and press "Run" button to execute it.

#Pacijent info
declare -a PACIJENT_IME=()
declare -a PACIJENT_PREZIME=()
declare -a PACIJENT_ADRESA=()
declare -a PACIJENT_JMBG=()
declare -a PACIJENT_ANALIZA=()

#Odjel info
declare -a ODJELI=()

declare -a ODJEL_1=()
declare -a ODJEL_2=()
declare -a ODJEL_3=()
declare -a ODJEL_4=()
declare -a ODJEL_5=()


#Funkcije
Kreiraj_Pacijenta_Funkcija(){
    read -p "* Unesite ime pacijenta: " TEMP_IME
    read -p "* Unesite prezime pacijenta: " TEMP_PREZIME
    read -p "* Unesite adresu pacijenta: " TEMP_ADRESA
    read -p "* Unesite JMBG pacijenta: " TEMP_JMBG
    read -p "* Unesite analizu pacijenta pacijenta: " TEMP_ANALIZA
    echo -e "\nKreiranje..."
    sleep 2
    echo -e "\nPacijent je uspjesno kreiran!"
    
    PACIJENT_IME+=($TEMP_IME)
    PACIJENT_PREZIME+=($TEMP_PREZIME)
    PACIJENT_ADRESA+=($TEMP_ADRESA)
    PACIJENT_JMBG+=($TEMP_JMBG)
    PACIJENT_ANALIZA+=($TEMP_ANALIZA)
}

Lista_Pacijenata_Funkcija(){
    for (( i = 0; i < ${#PACIJENT_IME[@]}; i++ ))
    do
        echo "** Pacijent: " $(( $i+1 ))
        echo "Ime: "${PACIJENT_IME[i]}
        echo "Prezime: "${PACIJENT_PREZIME[i]}
        echo "Adresa: "${PACIJENT_ADRESA[i]}
        echo "JMBG: "${PACIJENT_JMBG[i]}
        echo "Analiza: "${PACIJENT_ANALIZA[i]}
        echo
    done
}




#Main


ADMIN_IME=Amar
ADMIN_PASSWORD=1234


USER_PASSWORD=0000

while true
do
    echo -e "\n\t\t\tZdravstveni sistem\n"
    select MAIN_MENU in Administrator Korisnik Exit
    do
        case $MAIN_MENU in
            Administrator)
                echo -e "\n\t\t\tAdministrator\n"
                read -p "* Unesite vase ime: " IME_VAlIDACIJA
                read -sp "* Unesite vasu lozinku: " PASSWORD_VAlIDACIJA
                echo -e "\n\nProvjerava se...\n"
                sleep 3
                if [ $ADMIN_IME == $IME_VAlIDACIJA ] && [ $ADMIN_PASSWORD -eq $PASSWORD_VAlIDACIJA ]
                then
                    
                    while true
                    do
                        echo -e "\n\t\t\tUlogovani ste kao admin!\n"
                        select ADMIN_MENU in Kreiraj_Pacijenta Uredi_Pacijenta Obrisi_Pacijenta Lista_Pacijenata Kreiraj_Odjel Exit
                        do
                            case $ADMIN_MENU in
                                Kreiraj_Pacijenta)
                                    echo -e "\n\t\t\tKreiraj_Pacijenta\n"
                                    Kreiraj_Pacijenta_Funkcija
                                    break
                                ;;
                                Uredi_Pacijenta)
                                    echo -e "\n\t\t\tUredi_Pacijenta\n"
                                    Lista_Pacijenata_Funkcija
                                        if (( ${#PACIJENT_IME[@]} == "0" ))
                                        then
                                            echo -e "Nema aktivnih pacijenata!"
                                            break
                                        else
                                            read -p "* Unesite redni broj pacijenta kako bi nastavili sa uredjivanjem: " INDEX
                                            echo
                                            echo -e "Pretrazivanje...\n"
                                            sleep 2
                                            INDEX=$INDEX-1
                                            NADJEN=0
                                            for (( i = 0; i < ${#PACIJENT_IME[@]}; i++ )) 
                                            do
                                                if [ ${PACIJENT_IME[i]} == ${PACIJENT_IME[INDEX]} ]
                                                then
                                                    NADJEN=1
                                                    echo "** Pacijent " $(( $i+1 ))
                                                    echo "Ime: "${PACIJENT_IME[INDEX]}
                                                    echo "Prezime: "${PACIJENT_PREZIME[INDEX]}
                                                    echo "Adresa: "${PACIJENT_ADRESA[INDEX]}
                                                    echo "JMBG: "${PACIJENT_JMBG[INDEX]}
                                                    echo "Analiza: "${PACIJENT_ANALIZA[INDEX]}
                                                    echo
                                                    
                                                    echo -e "\n\t\t\tIzaberite sta zelite urediti: "
                                                    select EDIT_MENU in Ime Prezime Adresa JMBG Analiza Exit
                                                    do
                                                        case $EDIT_MENU in
                                                            Ime)
                                                                echo -e "\n\t\t\tIme\n"
                                                                echo "Staro ime:" ${PACIJENT_IME[INDEX]}
                                                                read -p "* Unesite novo ime pacijenta: " NOVO_IME
                                                                echo "Novo ime: " $NOVO_IME
                                                                PACIJENT_IME[INDEX]=$NOVO_IME
                                                                echo -e "\nUredjivanje...\n"
                                                                sleep 1
                                                                echo -e "\nPacijent je uspjesno uredjen!\n"
                                                                break 3
                                                            ;;
                                                            Prezime)
                                                                echo -e "\n\t\t\tPrezime\n"
                                                                echo "Staro prezime:" ${PACIJENT_PREZIME[INDEX]}
                                                                read -p "* Unesite novo prezime pacijenta: " NOVO_PREZIME
                                                                echo "Novo prezime: " $NOVO_PREZIME
                                                                PACIJENT_PREZIME[INDEX]=$NOVO_PREZIME
                                                                echo -e "\nUredjivanje...\n"
                                                                sleep 1
                                                                echo -e "\nPacijent je uspjesno uredjen!\n"
                                                                break 3
                                                                
                                                            ;;
                                                            Adresa)
                                                                echo -e "\n\t\t\tAdresa\n"
                                                                echo "Stara adresa:" ${PACIJENT_ADRESA[INDEX]}
                                                                read -p "* Unesite novu adresu pacijenta: " NOVA_ADRESA
                                                                echo "Nova adresa: " $NOVA_ADRESA
                                                                PACIJENT_ADRESA[INDEX]=$NOVA_ADRESA
                                                                echo -e "\nUredjivanje...\n"
                                                                sleep 1
                                                                echo -e "\nPacijent je uspjesno uredjen!\n"
                                                                break 3
                                                                
                                                            ;;
                                                            JMBG)
                                                                echo -e "\n\t\t\tJMBG\n"
                                                                echo "Stari JMBG :" ${PACIJENT_JMBG[INDEX]}
                                                                read -p "* Unesite novi JMBG pacijenta: " NOVI_JBMG
                                                                echo "Novi JMBG: " $NOVI_JBMG
                                                                PACIJENT_JMBG[INDEX]=$NOVI_JBMG
                                                                echo -e "\nUredjivanje...\n"
                                                                sleep 1
                                                                echo -e "\nPacijent je uspjesno uredjen!\n"
                                                                break 3
                                        
                                                            ;;
                                                            Analiza)
                                                                echo -e "\n\t\t\tAnaliza\n"
                                                                echo "Stara analiza :" ${PACIJENT_ANALIZA[INDEX]}
                                                                read -p "* Unesite novu analizu pacijenta: " NOVA_ANALIZA
                                                                echo "Nova analiza: " $NOVA_ANALIZA
                                                                PACIJENT_ANALIZA[INDEX]=$NOVA_ANALIZA
                                                                echo -e "\nUredjivanje...\n"
                                                                sleep 1
                                                                echo -e "\nPacijent je uspjesno uredjen!\n"
                                                                break 3
                                                            ;;
                                                            Exit)
                                                                echo "Izlaz..."
                                                                break 3
                                                            ;;
                                                            *)
                                                                echo "Greska!"
                                                            ;;
                                                        esac
                                                     done
                                                fi
                                                if (( $NADJEN == "0" && $i == $((${#PACIJENT_IME[@]}-1)) ))
                                                then
                                                    echo -e "\nPacijent sa tim rednim brojem se ne nalazi u nasoj bazi!\n"
                                                    break 2
                                                fi
                                            done
                                        fi
                                ;;
                                Obrisi_Pacijenta)
                                    echo -e "\n\t\t\tObrisi_Pacijenta\n"
                                    Lista_Pacijenata_Funkcija
                                    if (( ${#PACIJENT_IME[@]} == "0" ))
                                    then
                                        echo -e "Nema aktivnih pacijenata!"
                                        break
                                    else
                                        read -p "* Unesite redni broj pacijenta kako bi ga obrisali iz baze: " INDEX
                                        INDEX=$INDEX-1
                                        NADJEN=0
                                        echo -e "\nPretrazivanje..."
                                        sleep 2
                                        for (( i = 0; i < ${#PACIJENT_IME[@]}; i++ )) 
                                        do
                                            if [ "${PACIJENT_IME[i]}" == "${PACIJENT_IME[INDEX]}" ]
                                            then
                                                NADJEN=1
                                                echo -e "\n** Pacijent "$(( $i+1 ))
                                                echo "Ime: "${PACIJENT_IME[INDEX]}
                                                echo "Prezime: "${PACIJENT_PREZIME[INDEX]}
                                                echo "Adresa: "${PACIJENT_ADRESA[INDEX]}
                                                echo "JMBG: "${PACIJENT_JMBG[INDEX]}
                                                echo "Analiza: "${PACIJENT_ANALIZA[INDEX]}
                                                unset PACIJENT_IME[INDEX]
                                                unset PACIJENT_PREZIME[INDEX]
                                                unset PACIJENT_ADRESA[INDEX]
                                                unset PACIJENT_JMBG[INDEX]
                                                unset PACIJENT_ANALIZA[INDEX]
                                                echo -e "\nBrisanje..."
                                                sleep 1
                                                echo -e "\nPacijent je uspjesno obrisan!\n"
                                                break 2
                                            fi
                                            if (( $NADJEN == "0" && $i == $((${#PACIJENT_IME[@]}-1)) ))
                                            then
                                                echo -e "\nPacijent sa tim rednim brojem se ne nalazi u nasoj bazi!\n"
                                                break 2
                                            fi
                                        done
                                    fi
                                ;;
                                Lista_Pacijenata)
                                    echo -e "\n\t\t\tLista_Pacijenata\n"
                                    echo -e "Izlistavanje...\n"
                                    sleep 2
                                    if (( ${#PACIJENT_IME[@]} == "0" ))
                                    then
                                        echo -e "\nTrenutno nema aktivnih pacijenata!\n"
                                    else
                                        Lista_Pacijenata_Funkcija
                                    fi
                                    break
                                ;;
                                Kreiraj_Odjel)
                                    echo -e "\n\t\t\tKreiraj_Odjel\n"
                                    ODJEL_HELP=1
                                    read -p "* Unesite naziv odjela: " TEMP_ODJEL
                                    echo -e "\nKeiranje..."
                                    sleep 2
                                    if (( ${#ODJELI[@]} == "5" ))
                                    then
                                        echo -e "\nKreiranje novog odjela nije moguce, kapaciteti su popunjeni!\n"
                                        break
                                    else
                                        for (( i = 0; i < ${#ODJELI[@]}; i++ ))
                                        do
                                            if [ ${ODJELI[i]} == $TEMP_ODJEL ]
                                            then
                                                echo -e "\nOdjel vec postoji!\n"
                                                ODJEL_HELP=0
                                                break 2
                                            fi
                                        done
        
                                        if (( $ODJEL_HELP == "1" ))
                                        then
                                           ODJELI+=($TEMP_ODJEL)
                                           echo -e "\nNovi odjel je uspjesno kreiran!\n"
                                           break
                                        fi
                                    fi
                                ;;
                                Exit)
                                    echo -e "\nIzlaz..."
                                    break 3
                                ;;
                                *)
                                    echo -e "\nGreska pri unosu!\n"
                                ;;
                            esac
                        done
                    done
                else
                    echo "Pogresan unos, ili ne postojite u nasoj bazi!"
                    break
                fi
            ;;
            Korisnik)
                echo -e "\n\t\t\tKorisnik\n"
                read -p "* Unesite vase ime: " USER_IME_VALIDACIJA
                read -sp "* Unesite vasu lozinku: " USER_PASSWORD_VAlIDACIJA
                echo -e "\n\nProvjerava se..."
                sleep 3
                POSTOJI=0
                if (( ${#PACIJENT_IME[@]} == "0" ))
                then
                        echo -e "\nPogresan unos, ili ne postojite u nasoj bazi!\n"
                        break 
                else
                    for (( i = 0; i < ${#PACIJENT_IME[@]}; i++ )) 
                    do
                        if [ ${PACIJENT_IME[i]} == $USER_IME_VALIDACIJA ] && [ $USER_PASSWORD -eq $USER_PASSWORD_VAlIDACIJA ]
                        then
                            POSTOJI=1
                            while true
                            do
                                echo -e "\n\t\t\tUlogovani ste kao korisnik!\n"
                                select USER_MENU in Ispis_kartona Zahtjev_za_prijem_na_odjel Prikaz_trenutnih_kapaciteta_na_odjelima Exit
                                do
                                    case $USER_MENU in
                                        Ispis_kartona)
                                            echo -e "\n\t\t\tIspis kartona\n"
                                            echo "Pacijent: " $(( $i+1 ))
                                            echo "Ime: "${PACIJENT_IME[i]}
                                            echo "Prezime: "${PACIJENT_PREZIME[i]}
                                            echo "Adresa: "${PACIJENT_ADRESA[i]}
                                            echo "JMBG: "${PACIJENT_JMBG[i]}
                                            echo "Analiza: "${PACIJENT_ANALIZA[i]}
                                            break
                                        ;;
                                        Zahtjev_za_prijem_na_odjel)
                                            echo -e "\n\t\t\tZahtjev_za_prijem_na_odjel\n"
                                            if (( ${#ODJELI[@]} == "0" ))
                                            then
                                                echo -e "Nema dostupnih odjela!"
                                                break
                                            else
                                                for (( j = 0; j < ${#ODJELI[@]}; j++ ))
                                                do
                                                    echo $(( $j+1 )) ") " ${ODJELI[j]}
                                                done
                                                
                                                read -p "* Unesite redni broj odjela za koji zelite da predate zahtjev: " RBR_ODJELA
                                                echo -e "\nMolimo pricekajte, da provjerimo da li imamo slobodnih termina danas!\n"
                                                sleep 3
                                                IME_PREZIME_POMOC=""
                                                if (( $RBR_ODJELA < "1" || $RBR_ODJELA > "5" ))
                                                then
                                                    echo "Unijeli ste nevazeci redni broj odjela!"
                                                    break
                                                elif (( ${#ODJELI[@]} >= "1" && $RBR_ODJELA == "1" ))
                                                then
                                                    if (( ${#ODJEL_1[@]} > "8" ))
                                                    then
                                                        echo ${ODJELI[RBR_ODJELA-1]} " nema slobodnih termina danas, pokusajte sutra ponovo!"
                                                        break
                                                    else
                                                        echo -e "Uspjesno ste rezervisali termin!"
                                                        IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                                        IME_PREZIME_POMOC+=" "
                                                        IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                                        ODJEL_1+=("$IME_PREZIME_POMOC")
                                                        break
                                                    fi
                                                    
                                                elif (( ${#ODJELI[@]} >= "2" && $RBR_ODJELA == "2" ))
                                                then
                                                    if (( ${#ODJEL_2[@]} > "8" ))
                                                    then
                                                        echo ${ODJELI[RBR_ODJELA-1]} " nema slobodnih termina danas, pokusajte sutra ponovo!"
                                                        break
                                                    else
                                                        echo -e "\nUspjesno ste rezervisali termin!"
                                                        IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                                        IME_PREZIME_POMOC+=" "
                                                        IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                                        ODJEL_2+=("$IME_PREZIME_POMOC")
                                                        break
                                                    fi
                                                    
                                                elif (( ${#ODJELI[@]} >= "3" && $RBR_ODJELA == "3" ))
                                                then
                                                    if (( ${#ODJEL_3[@]} > "8" ))
                                                    then
                                                        echo ${ODJELI[RBR_ODJELA-1]} " nema slobodnih termina danas, pokusajte sutra ponovo!"
                                                        break
                                                    else
                                                        echo -e "\nUspjesno ste rezervisali termin!"
                                                        IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                                        IME_PREZIME_POMOC+=" "
                                                        IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                                        ODJEL_3+=("$IME_PREZIME_POMOC")
                                                        break
                                                    fi
                                                    
                                                elif (( ${#ODJELI[@]} >= "4" && $RBR_ODJELA == "4" ))
                                                then
                                                    if (( ${#ODJEL_4[@]} > "8" ))
                                                    then
                                                        echo ${ODJELI[RBR_ODJELA-1]} " nema slobodnih termina danas, pokusajte sutra ponovo"
                                                        break
                                                    else
                                                        echo -e "\nUspjesno ste rezervisali termin!"
                                                        IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                                        IME_PREZIME_POMOC+=" "
                                                        IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                                        ODJEL_4+=("$IME_PREZIME_POMOC")
                                                        break
                                                    fi
                                                    
                                                elif (( ${#ODJELI[@]} >= "5" && $RBR_ODJELA == "5" ))
                                                then
                                                     if (( ${#ODJEL_5[@]} > "8" ))
                                                    then
                                                        echo ${ODJELI[RBR_ODJELA-1]} " nema slobodnih termina danas, pokusajte sutra ponovo!"
                                                        break
                                                    else
                                                        echo -e "\nUspjesno ste rezervisali termin!"
                                                        IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                                        IME_PREZIME_POMOC+=" "
                                                        IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                                        ODJEL_5+=("$IME_PREZIME_POMOC")
                                                        break
                                                    fi
                                                fi
                                            fi
            
                                        ;;
                                        Prikaz_trenutnih_kapaciteta_na_odjelima)
                                            echo -e "\n\t\t\tPrikaz_trenutnih_kapaciteta_na_odjelima\n"
                                            
                                            IME_PREZIME_POMOC=""
                                            IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                            IME_PREZIME_POMOC+=" "
                                            IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                            NADJEN=0
                                            if (( ${#ODJELI[@]} == "0"))
                                            then
                                                echo "Trenutno nemate ni jedan aktivan odjel!"
                                                break
                                            else
                                                for (( j = 0; j < ${#ODJELI[@]}; j++ ))
                                                do
                                                    if  (( ${#ODJELI[@]} >= "1" && j == "0" ))
                                                    then
                                                        echo -n $(( $j+1 )) ") " ${ODJELI[j]} " "
                                                        
                                                        if (( ${#ODJEL_1[@]} == "0" ))
                                                        then
                                                            echo
                                                        fi
                                                        
                                                        for (( k = 0; k < ${#ODJEL_1[@]}; k++ ))
                                                        do  
                                                            if [ "${ODJEL_1[k]}" == "$IME_PREZIME_POMOC" ]
                                                            then
                                                                NADJEN=1
                                                            else
                                                                echo -n "-"
                                                                
                                                                if (( $k == $((${#ODJEL_1[@]}-1)) ))
                                                                then
                                                                    echo
                                                                    break
                                                                fi
                                                            fi
                                                            
                                                            if (( $NADJEN == "1" && $k == $((${#ODJEL_1[@]}-1)) ))
                                                            then
                                                                echo -e " " $IME_PREZIME_POMOC
                                                                NADJEN=0
                                                                break
                                                            fi
                                                            
                                                        done
                                                    fi
                                                    
                                                    if  (( ${#ODJELI[@]} >= "2" && j == "1" ))
                                                    then
                                                        echo -n $(( $j+1 )) ") " ${ODJELI[j]} " "
                                                        
                                                        if (( ${#ODJEL_2[@]} == "0" ))
                                                        then
                                                            echo
                                                        fi
                                                        
                                                        for (( k = 0; k < ${#ODJEL_2[@]}; k++ ))
                                                        do
                                                            if [ "${ODJEL_2[k]}" == "$IME_PREZIME_POMOC" ]
                                                            then
                                                                NADJEN=1
                                                            else
                                                                echo -n "-"
                                                               if (( $k == $((${#ODJEL_1[@]}-1)) ))
                                                                then
                                                                    echo
                                                                    break
                                                                fi
                                                            fi
                                                            
                                                            if (( $NADJEN == "1" && $k == $((${#ODJEL_2[@]}-1)) ))
                                                            then
                                                                echo -e " " $IME_PREZIME_POMOC
                                                                NADJEN=0
                                                                break
                                                            fi
                                                        done
                                                    fi
                                                    
                                                    if  (( ${#ODJELI[@]} >= "3" && j == "2" ))
                                                    then
                                                        echo -n $(( $j+1 )) ") " ${ODJELI[j]} " "
                                                        
                                                        if (( ${#ODJEL_3[@]} == "0" ))
                                                        then
                                                            echo
                                                        fi
                                                        
                                                        for (( k = 0; k < ${#ODJEL_3[@]}; k++ ))
                                                        do
                                                            if [ "${ODJEL_3[k]}" == "$IME_PREZIME_POMOC" ]
                                                            then
                                                                NADJEN=1
                                                            else
                                                                echo -n "-"
                                                            if (( $k == $((${#ODJEL_1[@]}-1)) ))
                                                                then
                                                                    echo
                                                                    break
                                                                fi
                                                            fi
                                                            
                                                            if (( $NADJEN == "1" && $k == $((${#ODJEL_3[@]}-1)) ))
                                                            then
                                                                echo -e " " $IME_PREZIME_POMOC
                                                                NADJEN=0
                                                                break
                                                            fi
                                                        done
                                                    fi
                                                    
                                                    if  (( ${#ODJELI[@]} >= "4" && j == "3" ))
                                                    then
                                                        for (( k = 0; k < ${#ODJEL_4[@]}; k++ ))
                                                        do
                                                            echo -n $(( $j+1 )) ") " ${ODJELI[j]} " "
                                                            
                                                            if (( ${#ODJEL_4[@]} == "0" ))
                                                            then
                                                                echo
                                                            fi
                                                        
                                                            if [ "${ODJEL_4[k]}" == "$IME_PREZIME_POMOC" ]
                                                            then
                                                                NADJEN=1
                                                            else
                                                                echo -n "-"
                                                                if (( $k == $((${#ODJEL_1[@]}-1)) ))
                                                                then
                                                                    echo
                                                                    break
                                                                fi
                                                            fi
                                                            
                                                            if (( $NADJEN == "1" && $k == $((${#ODJEL_4[@]}-1)) ))
                                                            then
                                                                echo -e " " $IME_PREZIME_POMOC
                                                                NADJEN=0
                                                                break
                                                            fi
                                                        done
                                                    fi
                                                    
                                                    if  (( ${#ODJELI[@]} >= "5" && j == "4" ))
                                                    then
                                                        echo -n $(( $j+1 )) ") " ${ODJELI[j]} " "
                                                        
                                                        if (( ${#ODJEL_5[@]} == "0" ))
                                                        then
                                                            echo
                                                        fi
                                                        
                                                        for (( k = 0; k < ${#ODJEL_5[@]}; k++ ))
                                                        do
                                                            if [ "${ODJEL_5[k]}" == "$IME_PREZIME_POMOC" ]
                                                            then
                                                                NADJEN=1
                                                            else
                                                                echo -n "-"
                                                                if (( $k == $((${#ODJEL_1[@]}-1)) ))
                                                                then
                                                                    echo
                                                                    break
                                                                fi
                                                            fi
                                                            
                                                            if (( $NADJEN == "1" && $k == $((${#ODJEL_5[@]}-1)) ))
                                                            then
                                                                echo -e " " $IME_PREZIME_POMOC
                                                                NADJEN=0
                                                                break
                                                            fi 
                                                        done
                                                    fi
                                                    
                                                done
                                                break
                                            fi
                                        ;;
                                        Exit)
                                            echo -e "\nIzlaz..."
                                            break 4
                                        ;;
                                        
                                        *)
                                            echo -e "\nGreska pri unosu!\n"
                                        ;;
                                    esac
                                done
                            done
                        fi
                        if (( $POSTOJI == "0" && $i == $((${#PACIJENT_IME[@]}-1)) ))
                        then
                            echo -e "\nPogresan unos, ili ne postojite u nasoj bazi!\n"
                            break 2
                        fi
                    done
                fi
            ;;
            Exit)
                echo -e "\nIzlaz..."
                break 2
            ;;
            *)
                echo -e "\nGreska pri unosu!\n"
            ;;
        esac
    done
done