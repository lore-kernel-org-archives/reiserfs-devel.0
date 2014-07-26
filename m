From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Bootcd-based LIVE Reiser4 rescue/recovery/installation ISO
Date: Sat, 26 Jul 2014 11:36:29 -0700
Message-ID: <CAM12Q5T5iSDq90bohY2Wz8j2AmEHCX41xQkvrff05bOcfWEqsA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <bounce-debian-live=glddl-live-moved1=m.gmane.org@lists.debian.org>
Sender: jose.r.r@metztli.com
Resent-Message-ID: <SF7xg84CFYB.A.sxC.BV_0TB@bendel>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <http://lists.debian.org/debian-live/>
List-Post: <mailto:debian-live@lists.debian.org>
List-Help: <mailto:debian-live-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-live-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-live-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Debian Live <debian-live@lists.debian.org>, debian-cloud <debian-cloud@lists.debian.org>

Apologies for incorrect password, relevant text file has been updated:

I uploaded to SF a bootcd-based live ISO made from a small 20GB pure
Reiser4 partition in my dev machine.

I patched a recent Linux kernel 3.15.2 as explained in Metztli IT's
blog < http://www.metztli-it.com/blog/index.php/aG2?blog=4 >, patched
legacy Grub97, and installed utilities gparted and testdisk.

Since Debian bootcd < https://packages.debian.org/sid/bootcd > may
also install a GNU/Linux system, I surmise that an (Reiser4)
installation is also possible, please read man and configuration files
under /etc/bootcd/

I tested ISO image under VirtualBox 4.3.12 and here is a snapshot: <
https://pbs.twimg.com/media/BsoJVE3CQAENw-t.png:large >

If interested in giving it a spin, please download at:

< https://sourceforge.net/projects/xonecuiltzin/ >


Best Professional Regards.

On Wed, Jul 16, 2014 at 12:09 PM, Jose R R <Jose.r.r@metztli-it.com> wrote:
> Niltze!
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
[...]


-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
NEW Apache OpenOffice 4.1.0! Download for GNU/Linux, Mac OS, Windows.
---------------------------------------------------------------------------------------------
Daylight Saving Time in USA & Canada ends: Sunday, November 02, 2014
---------------------------------------------------------------------------------------------


-- 
To UNSUBSCRIBE, email to debian-live-request@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
Archive: https://lists.debian.org/CAM12Q5T5iSDq90bohY2Wz8j2AmEHCX41xQkvrff05bOcfWEqsA@mail.gmail.com

