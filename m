From: "Elias Ignacio Contreras" <enito@eudoramail.com>
Subject: Re: PLZ HELP, my 160gb 's DANGER :(
Date: Sat, 01 Mar 2003 23:26:20 -0800
Message-ID: <GKIBCODIKPGPGBAA@whowhere.com>
Reply-To: enito@eudoramail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Language: en
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

 cause this one is the trouble apparently, my assign table is fucked, i can mount dev/hde like without a defined partition, oh my god :(

plz tell me a tip :(

i can mount the disk but...i wanna fix the trouble of fdisk tell kme about no partition defined

--

On Sat, 1 Mar 2003 23:10:53   
 Todd Lyons wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Elias Ignacio Contreras wanted us to know:
>
>>and ..the weirdo i can mount and see dirs and stuff 
>>with mount -t reiserfs /dev/hde /mnt/disk
>
>If you're really mounting "hde" instead of "hde1", then there is no
>partition table.  That error message is normal in that case.  The
>question is "When you mount hde, is it correct or is there a problem
>with it?"
>- -- 
>Blue skies...		Todd
>| Get a bigger hammer!   |  Free Linux accounts!  Ssh to 127.0.0.1.  |
>| http://www.mrball.net  |  Use your existing name and password.     |
>| http://faq.mrball.net  |                         --Paul Timmins    |
>Linux kernel 2.4.19-16mdk   4 users,  load average: 0.00, 0.00, 0.00
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.0.7 (GNU/Linux)
>Comment: http://www.mrball.net/todd.asc
>
>iD8DBQE+Ya59IBT1264ScBURArfrAKCmJUDmYFUmbYhMcI17PvRyNemMYwCbB/b9
>ziBG6wytFRLsEIpc8WtFA6w=
>=wWd4
>-----END PGP SIGNATURE-----
>


Need a new email address that people can remember
Check out the new EudoraMail at
http://www.eudoramail.com
