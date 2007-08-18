From: Matthew <jackdachef@gmail.com>
Subject: Re: reiser4-for-2.6.22-2.patch
Date: Sat, 18 Aug 2007 19:48:43 +0200
Message-ID: <e85b9d30708181048v35301591vba01deced5e0824d@mail.gmail.com>
References: <loom.20070728T013136-358@post.gmane.org>
	 <46ABACE8.4050306@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_66564_15256817.1187459323840"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:references;
        b=WBJkuM61qTpzSXAO/Wr34WD8MQzjSKIBMYDN1pRgwL0NMvP9MBviY2qp3aqZ0c+v3x37Ntg0tDuStMPo59je9xP9cMazhKZaWG3SylZoRHc/SSEBIbQFrWtDVNcMe0dfIesjUBTyKPm3AxeewdlZLfwCwB/Q23pTdSC+N7zogxU=
In-Reply-To: <46ABACE8.4050306@namesys.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-devel@vger.kernel.org

------=_Part_66564_15256817.1187459323840
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Edward,

I just encountered a pretty strange situation:

first some data:
I'm running hardened Gentoo with glibc 2.6.1 & gcc-4.2.1 both with
hardened use-flags enabled
- my kernel running is a 2.6.22-based kernel with grsecurity and some
other fine speed enhancements (ck-patchset, adaptive readahead, latest
reiser4 patch 2.6.22-2)
- this also happens with hardened-sources 2.6.22-r2 + latest reiser4
patch 2.6.22-2

every time I'm booting into that system I get a corrupted libuuid.so* file:
it says things like: libfoo isn't an elf-file or similar

it doesn't seem to matter if I'm using e2fsprogs 1.39 and
corresponding ss and com_err or e2fsprogs 1.40 with corresponding ss
and com_err, with booting I mean it only gets to that point and then
refuses and reboots since it's dependent on that critical thing (??)
other files also seem to get corrupted, I can't say which ones since
it reboots pretty fast

util-linux version is 2.12r-r7

it's strange to say but it doesn't matter if I'm booting the kernel
with ro or rw on /root data still gets corrupted (where /root is/was a
standard formatted reiser4 partition with mkfs.reiser4 out from a
livecd with 2.6.21-based kernel with reiser4-patch from namesys if I
recall right

there's also no difference whether I use the old baselayout-1 or the
new and faster baselayout-2 (for that I have to append 'rw' at boot
otherwise reiser4 won't boot since it isn't recognized right)

gcc-version is 4.2.1 hardened with pie 9.0.7, I'm sure this also would
happen with other gcc version

I'm attaching my kernel-config so that you might be able to reproduce
it (hopefully) or at least get an idea of it

since I need this pc right now I had to replay my system from a
tarball to a reiserfs partition, so I unfortunately can't collect any
further data

Mat

------=_Part_66564_15256817.1187459323840
Content-Type: application/octet-stream; name=config-2.6.22-klight2-grsec
Content-Transfer-Encoding: base64
X-Attachment-Id: f_f5iei5wh
Content-Disposition: attachment; filename="config-2.6.22-klight2-grsec"


------=_Part_66564_15256817.1187459323840--
