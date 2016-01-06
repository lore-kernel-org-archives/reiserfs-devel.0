From: dimas <dimas000@ya.ru>
Subject: Re: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Wed, 6 Jan 2016 15:21:02 +0300
Message-ID: <20160106152102.21774e48@Ulf.tvoe.tv>
References: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1452082863;
	bh=2zdh+0XnUBA2DDAsJ5tBVxTZmr6wBv63F3EjAjiPNXk=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=fVHIaIFewtTcHB6NY9QnL/d8UdDIN62mZKzGWvSFiIW9WM9vMtbtQWMVjQVDDvHt5
	 vpwHP+ZAk0J1mV8/Uaab8+OJsKUqd/TJljPTKR5TqZ/elvWz1/DbhFZaeEjd+10HDo
	 Ndnj8VQtyKTh14c79D4ZH4bY9mr4XFH+bSbGVPJc=
In-Reply-To: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

great job, man!

> As for Stretch and Sid, manual intervention is required only to modify
> /etc/initramfs-tools/modules file by adding at the end:
> crc32c_intel
> reiser4
> *before* installing the custom Reiser4 kernel, thus:
> dpkg -i linux-image-4.3.0-1-amd64_4.3.3-5_amd64.deb
why dion't you do that by postinst trigger, before update-initramfs one? or
modify upd-initrmfs trigger, adding couple of lines...

> dpkg -i parted_3.2-12_amd64.deb libparted2_3.2-12_amd64.deb
would be much more comfortable, if you add "reiser4" to the package version.
like "x.y.z-n+reiser4". or maybe even name a package "parted-reiser4", with
smth like "provides: parted" and "conflicts: parted", so that it won't be
overwritten by original version on upgrade, but satisfy dependencies on "parted"

> Although I have created patches for most (or all ;-) of the above at
> GitHub, I realize Debian Unstable (Sid) is a fast moving development
> effort and within a couple of weeks the kernel referenced above will
> be outdated and d-i will refuse to install.
hmm, not sure about d-i logic, but what's the problem with slightly older
kernel? i'm running on 3.x (custom-setup r4 patched) on testing with no
problems so far
