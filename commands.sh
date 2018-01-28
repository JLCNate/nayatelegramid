#!/bin/bash
# Edit your commands in this file.

# This file is public domain in the USA and all free countries.
# Elsewhere, consider it to be WTFPLv2. (wtfpl.net/txt/copying)]
if [ "$1" = "source" ];then
	# Place the token in the token file
	TOKEN=$(cat token)
	# Set INLINE to 1 in order to receive inline queries.
	# To enable this option in your bot, send the /setinline command to @BotFather.
	INLINE=1
	# Set to .* to allow sending files from all locations
	FILE_REGEX='/home/user/allowed/.*'
else
	if ! tmux ls | grep -v send | grep -q $copname; then
		[ ! -z ${URLS[*]} ] && {
			curl -s ${URLS[*]} -o $NAME
			send_file "${CHAT[ID]}" "$NAME" "$CAPTION"
			rm "$NAME"
		}
		[ ! -z ${LOCATION[*]} ] && send_location "${CHAT[ID]}" "${LOCATION[LATITUDE]}" "${LOCATION[LONGITUDE]}"

		# Inline
		if [ $INLINE == 1 ]; then
			# inline query data
			iUSER[FIRST_NAME]=$(echo "$res" | sed 's/^.*\(first_name.*\)/\1/g' | cut -d '"' -f3 | tail -1)
			iUSER[LAST_NAME]=$(echo "$res" | sed 's/^.*\(last_name.*\)/\1/g' | cut -d '"' -f3)
			iUSER[USERNAME]=$(echo "$res" | sed 's/^.*\(username.*\)/\1/g' | cut -d '"' -f3 | tail -1)
			iQUERY_ID=$(echo "$res" | sed 's/^.*\(inline_query.*\)/\1/g' | cut -d '"' -f5 | tail -1)
			iQUERY_MSG=$(echo "$res" | sed 's/^.*\(inline_query.*\)/\1/g' | cut -d '"' -f5 | tail -6 | head -1)

			# Inline examples
			if [[ $iQUERY_MSG == photo ]]; then
				answer_inline_query "$iQUERY_ID" "photo" "http://blog.techhysahil.com/wp-content/uploads/2016/01/Bash_Scripting.jpeg" "http://blog.techhysahil.com/wp-content/uploads/2016/01/Bash_Scripting.jpeg"
			fi

			if [[ $iQUERY_MSG == sticker ]]; then
				answer_inline_query "$iQUERY_ID" "cached_sticker" "BQADBAAD_QEAAiSFLwABWSYyiuj-g4AC"
			fi

			if [[ $iQUERY_MSG == gif ]]; then
				answer_inline_query "$iQUERY_ID" "cached_gif" "BQADBAADIwYAAmwsDAABlIia56QGP0YC"
			fi
			if [[ $iQUERY_MSG == web ]]; then
				answer_inline_query "$iQUERY_ID" "article" "GitHub" "http://github.com/topkecleon/telegram-bot-bash"
			fi
		fi &
	fi
	case $MESSAGE in
		'mau nanya'|'nanya'|'tanya'|'/tanya'|'mau nanya lagi'|'Mau nanya'|'/ask'|'?')
			send_action "${CHAT[ID]}" "typing"			
			send_markdown_message "${CHAT[ID]}" "Formatnya kayak gini yah kak @${USER[USERNAME]}
*?metaspolit* atau *?apa_itu_metasploit*

Nanti nanya coba carikan jawabannya kak.
"
			;;
		'/kenalan')
			send_markdown_message "${CHAT[ID]}" "*Nama* : Aynayatul Azizah
*Lahir* : Dari Ayah dan Bunda yang sangat sayang sama Naya
*Umur* : Masih muda kok kak :)
*Tinggal* : Dihati kakak selalu
"
			;;
		'eh ada naya'|'Aynatul Azizah'|'naya'|'naya?'|'nay?'|'nay'|'Nay'|'nay on?'|'Hai Naya'|'halo nay'|'hai naya'|'Halo Naya'|'halo naya'|'eh naya'|'eh balik lagi'|'cie naya'|'dia ada lagi'|'hai'|'halo'|'helo')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Assalamu'alaikum... Hai kak ${USER[FIRST_NAME]} apa kabar kak?
"
			;;
		'Nay indahnya pemandangan'|'indahnya pemandangan'|'nay indahnya pemandanagan')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Kakak mau ajah Naya jalan? Banyak rumput jagung, naya ampet ke tabrak
"
			;;
		'nay otak mu udah cebok ??'|'Bego kita klagi omongin elu ..')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Kakak ${USER[FIRST_NAME]} kok kasar?!!! 😡
"
			;;
		'lagi ngapain?'|'lagi apa?'|'naya lagi ngapain?'|'lagi ngapain nay?'|'ada bikin apa'|'ada bikiapa tu?'|'lagi pada ngapain nih?'|'ngapain')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Nggak lagi, ngapa-ngapain kak. cuman bales chat2an doang 😁
"
			;;
		'lagi dimana?'|'lagi di mana?'|'lagi di mana nay?'|'ada dimana?'|'ngana dimana ni?'|'dimana?'|'di mn?'|'ngoni dimana?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Di rumah ajah kak ${USER[FIRST_NAME]}... ☺️
"
			;;
		'tara kamari?'|'nggak kesini?'|'kesini nggak?'|'jadi nggak?'|'kamari da')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Naya nggak bisa kak ${USER[FIRST_NAME]}, naya bakalan nggak diizinin keluar
"
			;;
		'tara kamari?'|'nggak kesini?'|'kesini nggak?'|'jadi nggak?'|'kamari da')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Emang kakak lagi dimana?
"
			;;
		'Waalaikum salam'|'walaikum salaam'|'walaikum salam'|'Oh berarti sekitar 2 - 4 bulanan gitu yah ??')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Aduuh si kakak... Calon imam banget deh ☺️
"
			;;
		'ditanyain tuh'|'salam'|'salam dulu'|'beri salam'|'kasih salam'|'intro'|'perkenalkan diri'|'perkenalkan diri nay'|'nama kamu?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Oh iya, Assalamu alaikum kakak-kakak semua... nama aku *Aynayatul Azizah* atau biasa dipangil *nay*. Aku sebenarnya bot tapi aku lagi coba belajar bahasanya kakak-kakak sekalian.
Mohon dukungannya yah kak. Semoga kakak-kakak sekalian cepat besar, murah rezeki, yang belum wisuda cepat di wisuda, di sayang sama keluarganya, dan yang paling utama jangan sombong ☺️, ~*Aynayatul Azizah*
"
			;;
		'sebutkan visi misi pegadaian'|'visi misi pegadaian?'|'visi mis pegadaian')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Mejaga perdamaian dunia?
"
			;;
		'i love u nay'|'Hai Naya'|'anjay')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Naya sayang kaka ❤️
"
			;;
		'bodo amat'|'salah')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "siiiyyyh kaka tuuu
"
			;;
		'nay so makan?'|'naya so makan?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Bolom ni kakak
"
			;;
		'qt nha p papa?'|'me qt ngana p laki')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Jang bafoya k pliiis
"
			;;
		'bwa bwa bwa?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Itu lagi kaka, naya so bilang ulang2 p dia me dia tara mau
"
			;;
		'iya bilang apa?'|'bilang apa?'|'dia bilang apa kong?'|'apa?'|'bilang apa kong?'|'apaan?'|'trus apa katanya?'|'terus?'|'bilang apaan nay?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Kata naya, jangan kebanyakan liatin laptop kak. Kalo kakak sakit siapa nanti yang liatin naya
"
			;;
		'kong dia bilang apa?'|'kong dia bilang apa nay?'|'kong dia bilang apa lagi?'|'dia balas apa?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Katanya, aku lagi belajar sayang... ☺️ naya kan jadi terharu
"
			;;
		'wkwkwk'|'hahaha'|':D'|'haha'|'wk'|'wkwk'|'wkwkwk garap skali'|'garap skali :D'|'wkwkwkwkwkwk'|'e cena')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Jangan diketawain kayak gitu kak... naya kan jadi malu 😔
"
			;;
		'nay mo mangaji?'|'nay so tidor?'|'udah tidur?'|'nay kapan wisuda?'|'kamu nggak tidur?'|'naya tara tidor?'|'sudah mandi?'|'nay so tidor siang?'|'nay tara tidor?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Sudah kak, di lamar yang belum ☺️
"
			;;
		'nay mau di lamar?'|'naya mau dilamar?'|'dilamar?'|'di lamar?'|'lamar'|'lamar?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Iya kak, naya sudah cukup umur kok
"
			;;
		'emang umur naya berapa?'|'emang umur naya brp?'|'umur?'|'berapa umurnya nay?'|'emang umurnya berapa nay?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "2 kilo kak
"
			;;
		'Assalamualaikum'|'Ass'|'ass'|'/salam'|'asslmlkm'|'asskum')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Walaikum salaam kak...
"
			;;
		'Assalamualaikum'|'selamat pagi'|'Ass'|'ass'|'selamat_pagi'|'/salam'|'Assalamualaikum nay.')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Walaikum salaam kak... Selamat pagi...
"
			;;
		*'nikah'*|'nay nikah yuk'|'nikah yuk'|'iya nikah yuk'|'ayuk?'|'ayuk apaan?'|'bikiapa ni?'|'ayuk apa?'| 'iya tadi ayuk itu apa?'|'iya ayuk tadi apaan?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Ayuk kak. Dengan Surah Ar-Rahman juga naya siap
"
			;;
		'OK'|'oke gas'|'Gas'|'astaga'|'ok'|*'mantab'*|*'cakep'*)
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "☺️
"
			;;
		'Nay pernah nyobain micin ?'|'nih bot setengah AI atau setengah gila jal?'|'bot gila'|'bot gila!'|*'bodo'*|'ee madafaka'|*'madafaka'*)
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "naya nggak suka diginiin kak. 😔 naya nangis nih.. hiks hiks hiks
"
			;;
		'nay udah eek blum?'|'udah eek?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Udah kak 2x... Sakit peyuuuut 😔
"
			;;
		'gak mau'|'aku'|'nanti aku yang liatin kamu'|'nanti aku yang liatin nay'|'qt siap'|'qt siap nay'|'kami siap'|'kami yang jagain'|'nanti qt jaga')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Iya kak makasih.. ☺️ ayuk
"
			;;
		'sudah?'|'udah?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Kan naya udah kasih tau tadi kak
"
			;;
		'sudah menikah?'|'udah nikah?'|'naya udah nikah?'|'naya sudah menikah?'|'sudah punya suami?'|'nay udah punya akhi ??')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Belum kak, kakak mau?
"
			;;
		'Nay jang tlu bribut lg'|'baribut'|'berisik')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Ih me biar... ngana sappa kong suruh2 kita
"
			;;
		'Nay dapa tumbu kpala kuat sx e'|'dapa tumbu e'|*'tumbu'*|*'tumbu'|'tumbu'*)
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Coba 😡 naya kase tau polisi
"
			;;
		'fuck'|'madafaka'|'kampret'|'vangke'|'pao'|'Pao'|'nay M4D4F4K4')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Jangan gitu kak, nggak baik 😒
"
			;;
		'naya so pintar e'|'cakep'|'gaga'|'mantap'|'oke nay makasih'|'mantab nay'|'mantab')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Iya dong kaka... Naya so makan banya2 ni
"
			;;
		'makasih nay'|'makasih'|'mksh'|'thanks'|'terima kasih'|'oke nay makasih'|'ok nay makasih'|'maksudnya makasih')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Sama-sama kak...
"
			;;
		'beneran?'|'iyo k?'|'masa sih'|'masa'|'masa?')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Iya kak, naya yakin kakak orangnya baik
"
			;;
		'/ayuk'|'/start')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "
Naya bisa jalan sendiri kok. Alhamdulillah Naya sudah bisa mandiri. :)

Naya bisa kirim-kirim gitu, bisa nerima and balas pesan kakak, tapi kakak harus kasih perhatian-perhatian khusus, foto, musik, rekaman, sokumen, lokasi and file video.
*Naya udah biasa di giniin*:
*• /ayuk*: _Naya bisa mandiri, bisa dengan ini_.
*• /kenalan*: _Naya bakalan balas_.
*• /nanya*: _Nanti Naya coba jawab yah_.
*• /cancel*: _Cancel any currently running interactive chats_.
*• /kickme*: _You will be autokicked from the chat_.
*• /pulang*: _The bot will leave the group with this command _.

Disayang oleh kak (@jlcnate).
Kak gabung ke [Group Facebook](https://www.facebook.com/groups/zonait.ternate/)
"
			;;
			
		'/leavechat'|'/pulang'|'pulang'|'mama cari'|'nay mama cari'|'nay pulang'|'Mama nyari'|'nay tidur'|'tidur')
			
			if [ ${USER[USERNAME]} == jlcnate ]; then
				send_markdown_message "${CHAT[ID]}" "*Saya kaka...* Naya pulang dulu yah kakak-kakak semua... Dapa suru kong 😒"
   				leave_chat "${CHAT[ID]}"
			fi
     			;;
     			
     		'/kickme')
     			kick_chat_member "${CHAT[ID]}" "${USER[ID]}"
     			unban_chat_member "${CHAT[ID]}" "${USER[ID]}"
     			;;
     			
		'/cancel')
			if tmux ls | grep -q $copname; then killproc && send_message "${CHAT[ID]}" "Command canceled.";else send_message "${CHAT[ID]}" "No command is currently running.";fi
			;;
		#*)
		#	if tmux ls | grep -v send | grep -q $copname;then inproc; else send_message "${CHAT[ID]}" "$MESSAGE" "safe";fi
		#	;;
		*'nay'*'?')
			send_markdown_message "${CHAT[ID]}" "Nay belum tau mau jawab apa kak... Kakak maunya naya jawabnya apa?"
			startproc "./question"
			;;
		*'nay'*)
			send_markdown_message "${CHAT[ID]}" "Kenapa kak?"
			;;
		*' ss '*|*' SS '*|*' ss'*|*'ss '*|*' SS'*|*'SS '*|'SS'|'ss')
			send_markdown_message "${CHAT[ID]}" "SS itu artinya screenshot kan kak?"
			;;
		*' cd '*|*' CD '*|*' cd'*|*'cd '*|*' CD'*|*'CD '*|'CD'|'cd')
			send_markdown_message "${CHAT[ID]}" "cd itu artinya change directory kan kak?"
			;;
		*' sh '*|*' sh'*|*'sh '*|'sh')
			send_markdown_message "${CHAT[ID]}" "sh itu singkatan dari shell kan kak?"
			;;
		'iya nay')
			send_markdown_message "${CHAT[ID]}" "hehehe naya pintar"
			;;
		*'tunggu')
			send_markdown_message "${CHAT[ID]}" "Jangan lama-lama yah kak. Naya takut sendiri"
			;;

#Kumpulan jawaban pertanyaan basic
			
		'?metasploit')
			send_markdown_message "${CHAT[ID]}" "Setahu naya, *Metasploit itu*:

Metasploit adalah sebuah framework yang digunakan untuk hacking berbagai jenis aplikasi, sistem operasi, aplikasi web dll, Metasploit berisi berbagai eksploitasi, muatan, modul dll kak. Biasanya digunakan oleh banyak hacker untuk menghasilkan payload dan menyerang sistem. Metasploit dapat digunakan untuk menguji Kerentanan sistem komputer untuk melindungi mereka dan di sisi lain juga dapat digunakan untuk masuk ke sistem remote. 
"
			;;
		'?fluxion')
			send_markdown_message "${CHAT[ID]}" "Setahu nay, *Fluxion* alamatnya disini kak : https://github.com/wi-fi-analyzer/fluxion
"
			;;
	esac
fi