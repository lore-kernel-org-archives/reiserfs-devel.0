From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Fri, 8 Jan 2016 01:38:20 -0800
Message-ID: <CAM12Q5RPFfOynEsfLX5Wi7EmaLKX3Q7AdVBON2bk666jX3hthg@mail.gmail.com>
References: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
	<20160106152102.21774e48@Ulf.tvoe.tv>
	<CAM12Q5Q_pdr27TEr4ZRY+2ZVG_VYfhZ6AeEHQyPatOL7UVXUXQ@mail.gmail.com>
	<20160106182029.722301b7@Ulf.tvoe.tv>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:content-type;
        bh=qJhUDWmkN2OBhRAyW2ddWWzeJ+dnweLWRm9zIaKCXIo=;
        b=UPGaGi+jfEZsadl9ySQZK3mzU4VkHU3tfGmDt4bqvhGOLeV9yyJuOc9/oT4QE2LtRz
         Yto55PqWG7SVLT9NsTQK9B/ysnQmdMAnWOEJJ/xux2HJS8hB8DEc+5eRDmvHq8poPz6c
         VRFYFNo01Lvr+I4VH1bjypSV0l32RlBEgOmQSPIfXp0yXbbw1Iwqcy9XmFjhTwJKqyma
         /274jDA93DnfVPPai5roF4PXw+6SIi6tqxk1lUMSs6U8g6aER03XWwZyvhS6oKaF4hAs
         EZKH7zK3ot7Jh9QrMSqF02svWIdw1szxYaP257/Xv+/BrBAgHWQFrH2TiCHzHHvih3Fh
         S6ng==
In-Reply-To: <20160106182029.722301b7@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org

On Wed, Jan 6, 2016 at 7:20 AM, dimas <dimas000@ya.ru> wrote:
> 2016-006 05:42 Jose R R <Jose.r.r@metztli-it.com> wrote:
>> I have built a modified version of initramfs-tools package that has as
>> default those Reiser4 -specific settings
>> but wanted to allow d-i to select most of its packages from regular
>> Debian repositories.
> well, i see. right way, probably. but you can the needed hook in any installion
> scripts that you modify anyhow. i think, you messed with any of those, yes?

This issue may be resolved subsequently -- although probably using a
procedure that occurs *earlier* than 'the hooks' :)
>
>> That suggestion is probably fine for the reiser4-parted DEBs but the
>> kernel included in d-i is 'picky' and I have not had luck changing its
>> name to something other than *official* Debian because d-i then
>> refuses to install from the Debian repositories.
> ouch, didn't know that it has such a strict restrictions

Using the same Debian Sid Linux kernel source, I generated another
Reiser4-enabled kernel 'the Debian Way' -- but with a custom changelog
that clearly shows has Reiser4 super power :D
https://metztli.it/readOnlyEphemeral/linux-image-4.3.0-1+reiser4.0.1-amd64_4.3.3-5+reiser4.0.2_amd64.tar

Once installed into a Debian distro, a uname -a yields:

Linux [host] 4.3.0-1+reiser4.0.1-amd64 #1 SMP Debian
4.3.3-5+reiser4.0.1 (2016-01-07) x86_64 GNU/Linux

Hence *hold* is not necessary for said kernel.

>
>> And for Debian Parted:
>> echo "parted hold" | dpkg --set-selections
>> echo "libparted2 hold" | dpkg --set-selections
>> And we can check for those packages effectively being on *hold* and
>> not replaced by Debian package manager, thus:
> that's the option, yeah, but placing packages on hold can lead to some expected
> dependecies conflicts in the future, and is generally rather "dirty" way. using
> special package names like "parted-reiser4" is much clear anyhow, what is more,
> you can easily run your local repo with r4-patched kernels/tools/libs, and it
> will be the most clear of obvious way for the enduser to keep all this stuff
> upgraded without worrying whether it's r4-patched stuff or not. this would be a
> perfect variant, i think. user just install "linux-....-reiser4",
> "parted-...-reiser4" and "whatever-....-reiser4", and you just build new
> packages from time to time, and everyone have their stuff updated usual way.

Well renaming Debian GNU Parted can wait -- as it is optional for the
user *even* after Debian is installed; i.e., I have embedded the
Reiser4-enabled lib/parted[2] UDEB into previoulsy referenced
Debian-Installer (d-i) netboot ISO:
http://metztli.it/readOnlyEphemeral/metztli_it-reiser4_d-i.iso

Thanks for your suggestions, Dimas.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
