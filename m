From: Kris Van Bruwaene <Kris.VanBruwaene@vrt.be>
Subject: Executability problem
Date: Tue, 30 Aug 2005 15:28:59 +0200
Message-ID: <20050830152859.45e0b010.Kris.VanBruwaene@vrt.be>
Reply-To: Kris.VanBruwaene@vrt.be
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25725-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I recently discovered that scripts have become non-executable on my reiserfs share, even though the -x flags are set:
root@A00012344:/home/kris# cat tst
#! /usr/bin/perl -w
print "Hello world\n";
root@A00012344:/home/kris# ./tst
bash: ./tst: /usr/bin/perl: bad interpreter: Toegang geweigerd #(=Access denied)
root@A00012344:/home/kris# perl tst
Hello world
root@A00012344:/home/kris# cp tst /tmp
root@A00012344:/home/kris# cd /tmp
root@A00012344:/tmp# ./tst
Hello world
root@A00012344:/tmp# ls tst -l
-rwxr-xr-x  1 root root 43 2005-08-30 15:19 tst
root@A00012344:/tmp# ls /home/kris/tst -l
-rwxrwxr-x  1 kris users 43 2005-08-25 11:00 /home/kris/tst
root@A00012344:/tmp# file tst
tst: perl script text executable
root@A00012344:/tmp# file /home/kris/tst
/home/kris/tst: perl script text executable

/tmp is on an ext3 share (same machine). The perl help unable to help, looks like a reiserfs problem. Some other info:
root@A00012344:/tmp# cat /etc/fstab | grep home
/dev/hda3 /home reiserfs defaults,exec,user,auto 0 0

(I just added the exec and did a remount to try but it didn't help, it's not really necessary)

root@A00012344:/tmp# uname -a
Linux A00012344 2.6.7 #2 SMP Wed Jul 28 04:25:36 CEST 2004 i686 GNU/Linux

Thx

Kris
*** Disclaimer ***

Deze e-mail, met eventuele bijlagen, is alleen bestemd voor de persoon of organisatie aan wie hij gericht is en, in voorkomend geval, alleen voor het daarin opgegeven doel of gebruik. Hij kan vertrouwelijke informatie bevatten en/of persoonlijke standpunten die niet noodzakelijk met die van de VRT stroken. Elk gebruik van deze informatie (zoals bewerken, doorsturen, geheel of gedeeltelijk reproduceren of verspreiden in welke vorm ook) door anderen dan de geadresseerde, is verboden. Hebt U deze e-mail per vergissing ontvangen, meld dat dan a.u.b. aan de VRT en wis de e-mail.
 

