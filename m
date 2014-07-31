From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Bootcd-based LIVE Reiser4 rescue/recovery/installation ISO
Date: Thu, 31 Jul 2014 01:53:47 -0700
Message-ID: <CAM12Q5RfSnpW-YwKfe0hnh5Er0iC-pNNXdxWn6=m7QiWa0Dm1Q@mail.gmail.com>
References: <CAM12Q5T5iSDq90bohY2Wz8j2AmEHCX41xQkvrff05bOcfWEqsA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAM12Q5T5iSDq90bohY2Wz8j2AmEHCX41xQkvrff05bOcfWEqsA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Debian Live <debian-live@lists.debian.org>, debian-cloud <debian-cloud@lists.debian.org>

Niltze, all-

Just uploaded to SourceForge version .01 of Xonecuiltzin Reiser4
bootcd-based LIVE rescue/installable ISO image:
xonecuiltzin-v01-reiser4.iso.

Bootable media includes latest gparted fix, gedit in addition to
existing vim text editor.
I included screenfetch utility to show some useful system info.
Also updated to latest fix to libaal-1.0.6 and reiser4progs 1.0.9:
debugfs.reiser4*  fsck.reiser4*  make_reiser4*  measurefs.reiser4*
mkfs.reiser4*

< https://pbs.twimg.com/media/Bt3BJuCCIAA52Oy.png:large >

Download: < https://sourceforge.net/projects/xonecuiltzin/ >

Enjoy!


Best Professional Regards.

On Sat, Jul 26, 2014 at 11:36 AM, Jose R R <Jose.r.r@metztli-it.com> wrote:
> Apologies for incorrect password, relevant text file has been updated:
>
> I uploaded to SF a bootcd-based live ISO made from a small 20GB pure
> Reiser4 partition in my dev machine.
>
> I patched a recent Linux kernel 3.15.2 as explained in Metztli IT's
> blog < http://www.metztli-it.com/blog/index.php/aG2?blog=4 >, patched
> legacy Grub97, and installed utilities gparted and testdisk.
>
> Since Debian bootcd < https://packages.debian.org/sid/bootcd > may
> also install a GNU/Linux system, I surmise that an (Reiser4)
> installation is also possible, please read man and configuration files
> under /etc/bootcd/
>
> I tested ISO image under VirtualBox 4.3.12 and here is a snapshot: <
> https://pbs.twimg.com/media/BsoJVE3CQAENw-t.png:large >
>
> If interested in giving it a spin, please download at:
>
> < https://sourceforge.net/projects/xonecuiltzin/ >
>
>
> Best Professional Regards.
>
> On Wed, Jul 16, 2014 at 12:09 PM, Jose R R <Jose.r.r@metztli-it.com> wrote:
>> Niltze!
>>
>> I uploaded to SF a bootcd-based live ISO made from a small 20GB pure
>> Reiser4 partition in my dev machine.
>>
>> I patched a recent Linux kernel 3.15.2 as explained in Metztli IT's
>> blog < http://www.metztli-it.com/blog/index.php/aG2?blog=4 >, patched
>> legacy Grub97, and installed utilities gparted and testdisk.
>>
>> Since Debian bootcd < https://packages.debian.org/sid/bootcd > may
>> also install a GNU/Linux system, I surmise that an (Reiser4)
>> installation is also possible, please read man and configuration files
>> under /etc/bootcd/
>>
>> I tested ISO image under VirtualBox 4.3.12 and here is a snapshot: <
>> https://pbs.twimg.com/media/BsoJVE3CQAENw-t.png:large >
>>
>> If interested in giving it a spin, please download at:
>>
>> < https://sourceforge.net/projects/xonecuiltzin/ >
>>
> [...]
>

-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
NEW Apache OpenOffice 4.1.0! Download for GNU/Linux, Mac OS, Windows.
---------------------------------------------------------------------------------------------
Daylight Saving Time in USA & Canada ends: Sunday, November 02, 2014
---------------------------------------------------------------------------------------------
