From: evilninja <evilninja@gmx.net>
Subject: Re: I've done a very bad mistake
Date: Thu, 01 Jul 2004 19:10:43 +0200
Message-ID: <40E44593.7090207@gmx.net>
References: <200407011523.48481.aotto1968@onlinehome.de> <1088696200.11333.58.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-19482-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1088696200.11333.58.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mikael Cluseau <nwrk@nwrk.dyndns.org>
Cc: aotto1968@t-online.de, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mikael Cluseau schrieb:
> Le jeu 01/07/2004 à 15:23, Andreas Otto a écrit :
>
>>Hi,
>>
>>  I've done as root:
>>   >> cp some_file /dev/hdb7
>
>
> I remember that cp ask to *replace* a file, not to "put the source file
> at the beginning of the target file". Did you really verified that your
> partition was really modified ? I would be very surprised of this
> attitude from cp...

hm, i was curious about this and i set up a testimage via losetup, so i
can use /dev/loop0 as it it were real devices.

when cp'ing to /dev/loop0, i was able to mount /dev/loop0 again with
reiserfs, and no files are corrupted (diff). with ext3, i had to fsck
loop0, then one entry was taken to lost+found, but no corruptions
present as far as diff can tell. all this was done with devfs. so, "cp"
really writes *to* the file, it does not replace it, right?

maybe the OP only has to try latest reiserfsck...

just my 2¢,
Christian.
- --
BOFH excuse #112:

The monitor is plugged into the serial port
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFA5EWTC/PVm5+NVoYRAg2zAKDlrJxWjxv/8+rFoR1bVpaedEzR1ACaA6yJ
aMJfJOfsq3TXpKbONOaiFEs=
=Iqji
-----END PGP SIGNATURE-----
