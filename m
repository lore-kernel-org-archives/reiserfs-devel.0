From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2.4.21 -> 2.4.25 cryptoloop mess
Date: Sat, 08 Jan 2005 12:59:28 -0800
Message-ID: <41E049B0.5020507@namesys.com>
References: <30550.1102921988@www5.gmx.net> <16382.1105193211@www43.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23092-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16382.1105193211@www43.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Danny Norging <norging@gmx.de>
Cc: reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vitaly@thebsh.namesys.com

Sorry about this, it is the russian holiday season right now.  Zam will=20
answer your email tomorrow.  I will complain to Vitaly about this.  He=20
has no excuse for missing emails.

Hans

Danny Norging wrote:

>Hi there,
>
>since Vitaly seems not to take notice of my mail and I cant afford another
>money-order (being just a student), I wonder if somebody else out there has
>*any* hint on what to try next. Please have a look at this
>
>Thanks
>
>--- Weitergeleitete Nachricht / Forwarded Message ---
>Date: Mon, 13 Dec 2004 08:13:08 +0100 (MET)
>From: "Danny Norging" <norging@gmx.de>
>To: Vitaly Fertman <vitaly@namesys.com>
>Subject: Re: money send, no reply? was: 2.4.21 -> 2.4.25 cryptoloop mess
>
>Hello,
>
>needed to buy a bigger hd so this took some time, but now i am done with
>your instructions (*thanks a lot for them, i have hope*). Still a lot of
>work to do, i guess... so this is what i have done:
>
># losetup -e aes /dev/loop0 /dev/hdc1
># dd if=3D/dev/loop0 of=3Dhdc1decrypted.dump
># losetup /dev/loop1 hdc1decrypted.dump
># reiserfsck --rebuild-tree -S /dev/loop1 -l reiserfsck.log
>
>where reiserfsck.log shows the following:
># cat reiserfsck.log=20
>####### Pass 0 #######
>28 directory entries were hashed with "r5" hash.
>####### Pass 1 #######
>####### Pass 2 #######
>####### Pass 3 #########
>vpf-10680: The directory [2 3] has the wrong block count in the StatData (=
2)
>- corrected to (1)
>vpf-10650: The directory [2 3] has the wrong size in the StatData (720) -
>corrected to (48)
>####### Pass 3a (lost+found pass) #########
>#
>
> =20
>
>>On Monday 06 December 2004 16:21, Danny Norging wrote:
>>   =20
>>
>>>Hello,
>>>     =20
>>>
>>Hello
>>
>>   =20
>>
>>>as stated in my original email (more than a month ago) I have send you
>>>     =20
>>>
>>30$
>>   =20
>>
>>>to get your support, but still got no reply from you :-(
>>>     =20
>>>
>>sorry for that, your email was missed somehow.
>>
>>   =20
>>
>>>*please* have a look at this
>>>
>>>thanks
>>>danny
>>>
>>>--- Weitergeleitete Nachricht / Forwarded Message ---
>>>Date: Thu, 4 Nov 2004 06:39:59 +0100 (MET)
>>>From: "Danny Norging" <norging@gmx.de>
>>>To: support@namesys.com
>>>Subject: 2.4.21 -> 2.4.25 cryptoloop mess
>>>
>>>Hello,
>>>
>>>before I start writing about my technical problems, I just want to
>>>     =20
>>>
>>mention
>>   =20
>>
>>>that I sent you a money-order for 30$ back in may this year, so it would
>>>     =20
>>>
>>be
>>   =20
>>
>>>great if you could help me with the following...
>>>
>>>I have been running a gentoo gnu/linux system with 2.4.21 kernel on an
>>>     =20
>>>
>>old
>>   =20
>>
>>>200mhz pentium using a second 120gb hd with a single partition for
>>>samba/nfs file-serving purposes. The reiserfs on this partition was
>>>     =20
>>>
>>build
>>   =20
>>
>>>on top of the cryptoloop device (256bit aes), so the initial setup was
>>>something like:
>>>
>>># dd if=3D/dev/urandom of=3D/dev/hdc1
>>># losetup -e aes /dev/loop0 /dev/hdc1
>>># mkreiserfs /dev/loop0
>>>
>>>All worked without any problems until a power failure somehow corrupted
>>>     =20
>>>
>>the
>>   =20
>>
>>>fs :-( Unfortunately, I did a complete system update to a 2.4.25 kernel
>>>trying to repair the reiserfs from this new system, and as there seems
>>>     =20
>>>
>>to
>>   =20
>>
>>>be a incompatibilty between the cryptoloop versions, this is where all
>>>really got mixed up :-( I cant remember all the steps i took using
>>>reiserfsck (at least once with the --rebuild-tree option) with the
>>>     =20
>>>
>>2.4.25
>>   =20
>>
>>>kernel and later with a downgraded 2.4.21 kernel maybe on a wrongly
>>>decrypted fs...
>>>     =20
>>>
>>if you run reiserfsck --rebuild-tree on the device with the wrong
>>decryption=20
>>you probably erase all the data on it.=20
>>
>>   =20
>>
>>>End of the story is that i am now able to losetup/decrypt the partition
>>>correctly (using 2.4.21 kernel again), as #hexdump -C /dev/loop0 shows
>>>     =20
>>>
>>me
>>   =20
>>
>>>lots of file-contents,=20
>>>     =20
>>>
>>do you mean that you see a lot of _correct_ file contents?=20
>>of files that are currently not reachable on the mounted fs?
>>   =20
>>
>
>Exactly (this is why i still have hope ;-) As this is a gentoo system there
>is lots of sourcecode on the partition, and while a grep on the mounted fs
>only shows this
># grep -r GNU *
>Binary file lost+found/92166_92185 matches
>Binary file lost+found/92196_92202 matches
>Binary file lost+found/92196_92203 matches
>#
>i get hundreds of lines of output with
># hexdump -C /dev/loop0 | grep GNU
>00012380  65 72 6d 73 20 6f 66 20  74 68 65 20 47 4e 55 20  |erms of the G=
NU
>|
>00016200  a3 21 6f 66 20 74 68 65  20 47 4e 55 20 47 65 6e  |.!of the GNU
>Gen|
>00016370  20 20 47 4e 55 20 47 65  6e 65 72 61 6c 20 50 75  |  GNU General
>Pu|
>000163c0  20 63 6f 70 79 20 6f 66  20 74 68 65 20 47 4e 55  | copy of the
>GNU|
>...
>
> =20
>
>>>but when i mount the partition, i get the following
>>>content:
>>>
>>>bart crypto # ls -Ral
>>>.:
>>>total 2
>>>drwxr-xr-x    4 root     root           80 Nov  4 02:59 .
>>>drwx------   11 root     root          480 Nov  4 05:14 ..
>>>drwx------    4 root     root          720 Apr  3  2004 lost+found
>>>
>>>./lost+found:
>>>total 91
>>>drwx------    4 root     root          720 Apr  3  2004 .
>>>drwxr-xr-x    4 root     root           80 Nov  4 02:59 ..
>>>-rwxr-x---    1 root     users         215 Jul 21  2003 1078_1080
>>>-rwxr-x---    1 root     users         385 Jul 21  2003 1081_1082
>>>-rwxr-x---    1 root     users         341 Jul 21  2003 1081_1083
>>>-rwxr-x---    1 root     users         371 Jul 21  2003 1081_1084
>>>-rwxr-x---    1 root     users    12103423998558959 Jul 21  2003
>>>     =20
>>>
>>1081_1085
>>   =20
>>
>>>-rwxr-x---    1 root     users         539 Jul 21  2003 1081_1086
>>>-rwxr-x---    1 root     users         407 Jul 21  2003 1081_1087
>>>-rwxr-x---    1 root     users        1844 Jul 21  2003 1081_1088
>>>-rwxrwxrwx    1 dnscache users        4000 Jul 24  2003 38910_45033
>>>-rwxrwxrwx    1 dnscache users        2425 Jul 24  2003 38910_45034
>>>-rwxrwxrwx    1 dnscache users        2865 Oct 23  2002 58627_65589
>>>-rwxrwxrwx    1 dnscache users       11313 Aug  5  2003 92166_92185
>>>-rwxrwxrwx    1 dnscache users         660 Aug  5  2003 92167_92168
>>>-rwxrwxrwx    1 dnscache users          20 Aug  5  2003 92167_92169
>>>-rwxrwxrwx    1 dnscache users          50 Aug  5  2003 92167_92170
>>>drwxrwxrwt    2 dnscache users         104 Aug  5  2003 92186_92187
>>>-rwxrwxrwx    1 dnscache users           2 Aug  5  2003 92187_92188
>>>drwxrwxrwt    2 dnscache users         128 Aug  5  2003 92191_92192
>>>-rwxrwxrwx    1 dnscache users         536 Aug  5  2003 92196_92201
>>>-rwxrwxrwx    1 dnscache users       12587 Aug  5  2003 92196_92202
>>>-rwxrwxrwx    1 dnscache users    742249513586003637 Aug  5  2003
>>>92196_92203
>>>
>>>./lost+found/92186_92187:
>>>total 10
>>>drwxrwxrwt    2 dnscache users         104 Aug  5  2003 .
>>>drwx------    4 root     root          720 Apr  3  2004 ..
>>>-rwxrwxrwx    1 dnscache users          24 Aug  5  2003 Repository
>>>-rwxrwxrwx    1 dnscache users          50 Aug  5  2003 Root
>>>
>>>./lost+found/92191_92192:
>>>total 14
>>>drwxrwxrwt    2 dnscache users         128 Aug  5  2003 .
>>>drwx------    4 root     root          720 Apr  3  2004 ..
>>>-rwxrwxrwx    1 dnscache users           2 Aug  5  2003 Entries
>>>-rwxrwxrwx    1 dnscache users          19 Aug  5  2003 Repository
>>>-rwxrwxrwx    1 dnscache users          50 Aug  5  2003 Root
>>>bart crypto #
>>>
>>>A reiserfsck on the crypoloop-device gives no errors:
>>>     =20
>>>
>>ok, the root directory was lost and everething what was found on the fs
>>was connected to the lost+found.
>>
>>   =20
>>
>>>bart root # reiserfsck /dev/loop0
>>>reiserfsck 3.6.18 (2003 www.namesys.com)
>>>
>>>*************************************************************
>>>** If you are using the latest reiserfsprogs and  it fails **
>>>** please  email bug reports to reiserfs-list@namesys.com, **
>>>** providing  as  much  information  as  possible --  your **
>>>** hardware,  kernel,  patches,  settings,  all reiserfsck **
>>>** messages  (including version),  the reiserfsck logfile, **
>>>** check  the  syslog file  for  any  related information. **
>>>** If you would like advice on using this program, support **
>>>** is available  for $25 at  www.namesys.com/support.html. **
>>>*************************************************************
>>>
>>>Will read-only check consistency of the filesystem on /dev/loop0
>>>Will put log info to 'stdout'
>>>
>>>Do you want to run this program?[N/Yes] (note need to type Yes if you
>>>do):Yes
>>>###########
>>>reiserfsck --check started at Thu Nov  4 05:18:11 2004
>>>###########
>>>Replaying journal..
>>>Reiserfs journal '/dev/loop0' in blocks [18..8211]: 0 transactions
>>>     =20
>>>
>>replayed
>>   =20
>>
>>>Checking internal tree..finished
>>>Comparing bitmaps..finished
>>>Checking Semantic tree:
>>>finished
>>>No corruptions found
>>>There are on the filesystem:
>>>        Leaves 3
>>>        Internal nodes 1
>>>        Directories 4
>>>        Other files 24
>>>        Data block pointers 10 (2 of them are zero)
>>>        Safe links 0
>>>###########
>>>reiserfsck finished at Thu Nov  4 05:18:48 2004
>>>###########
>>>bart root #
>>>
>>>As I am afraid of doing any more harm to the fs (not sure if this is
>>>     =20
>>>
>>even
>>   =20
>>
>>>possible ;-) I would like to know if its possible to recover the files.
>>>     =20
>>>
>>If
>>   =20
>>
>>>you would like to have more debugging output, I can send you that, or
>>>     =20
>>>
>>even
>>   =20
>>
>>>give you a ssh-connection to the machine.
>>>     =20
>>>
>>if you do not have a raw backup of the original device before rebuilding =

>>the tree, let's do the following:
>>* make it, the raw backup, with the dd. probably even the copy of already=
=20
>>decrypted device to make it all simplier and faster;
>>* reiserfsck --rebuild-tree -S the_copy -l logfile
>>
>>if this will not recover files which content you see with hexdump, we will
>>try to get them manually later.
>>
>>   =20
>>
>>>Any help would be *great*
>>>
>>>Greetings from Berlin
>>>Danny
>>>
>>>
>>>--
>>>NEU +++ DSL Komplett von GMX +++ http://www.gmx.net/de/go/dsl
>>>GMX DSL-Netzanschluss + Tarif zum superg=FCnstigen Komplett-Preis!
>>>     =20
>>>
>>--=20
>>Thanks,
>>Vitaly Fertman
>>
>>
>>   =20
>>
>
>Please tell me what else i can do to recover the files, TIA
>
>Greetings from Berlin
>Danny
>
> =20
>

