From: dimas <dimas000@ya.ru>
Subject: Re: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Wed, 6 Jan 2016 18:20:29 +0300
Message-ID: <20160106182029.722301b7@Ulf.tvoe.tv>
References: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
	<20160106152102.21774e48@Ulf.tvoe.tv>
	<CAM12Q5Q_pdr27TEr4ZRY+2ZVG_VYfhZ6AeEHQyPatOL7UVXUXQ@mail.gmail.com>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1452093631;
	bh=wwJ8Ze41bywaHPJ2usf0n57G6niouf2P9Daz3Y+xxaE=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=AzOExd8ROdSH0N31UbrHkvYDGT+naJQBke2W2HIlHKGlVdT8gvuir4ddtzVNd1lAr
	 opBy86yDpZPEwUDgC6R6wuoVm+bvYrply3TIcZC2lqw98b5b0Gy9rOfSpxj3yB5ipu
	 +pG4FlUQSYg2xMI94SbklCVm+an1b/aD1P01T/wY=
In-Reply-To: <CAM12Q5Q_pdr27TEr4ZRY+2ZVG_VYfhZ6AeEHQyPatOL7UVXUXQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

2016-006 05:42 Jose R R <Jose.r.r@metztli-it.com> wrote:
> I have built a modified version of initramfs-tools package that has as
> default those Reiser4 -specific settings
> but wanted to allow d-i to select most of its packages from regular
> Debian repositories.
well, i see. right way, probably. but you can the needed hook in any installion
scripts that you modify anyhow. i think, you messed with any of those, yes?

> That suggestion is probably fine for the reiser4-parted DEBs but the
> kernel included in d-i is 'picky' and I have not had luck changing its
> name to something other than *official* Debian because d-i then
> refuses to install from the Debian repositories.
ouch, didn't know that it has such a strict restrictions

> And for Debian Parted:
> echo "parted hold" | dpkg --set-selections
> echo "libparted2 hold" | dpkg --set-selections
> And we can check for those packages effectively being on *hold* and
> not replaced by Debian package manager, thus:
that's the option, yeah, but placing packages on hold can lead to some expected
dependecies conflicts in the future, and is generally rather "dirty" way. using
special package names like "parted-reiser4" is much clear anyhow, what is more,
you can easily run your local repo with r4-patched kernels/tools/libs, and it
will be the most clear of obvious way for the enduser to keep all this stuff
upgraded without worrying whether it's r4-patched stuff or not. this would be a
perfect variant, i think. user just install "linux-....-reiser4",
"parted-...-reiser4" and "whatever-....-reiser4", and you just build new
packages from time to time, and everyone have their stuff updated usual way.
