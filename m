From: <doiggl@velocitynet.com.au>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Fri, 13 Jun 2014 14:20:52 +1000
Message-ID: <9c62eabf39f50a48e3362dbce9cc6f9a@mail.velocitynet.com.au>
References: <20140423140033.704113918@suse.com> <a97220c3691f4bfc6e57283827b68524@mail.velocitynet.com.au> <535BCD38.5070607@suse.com> <cae4fb2a6e9302cd90b75a78d47ac7ef@mail.velocitynet.com.au> <c3acce54543811f458b7df2fa7122d53@mail.velocitynet.com.au> <537E00FA.8090500@suse.com> <2caab58290b2fea36dc2937a1ad13025@mail.velocitynet.com.au> <5399BB6E.306@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5399BB6E.306@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org


> 
> Glenn, for the same reason I declined to add them previously, I'm not
> going to add them to Factory. They'll get pulled in automatically via
> the next upstream kernel update.
> 
> - -Jeff
> 

Hello,

Re:They'll get pulled in automatically via the next upstream kernel
update.

Question:
So will the patches come down with say kernel-vanilla-3.15.0x
Example: Kernel:stable > kernel-vanilla > Build Log 

[  433s] build: extracting built packages...
[  465s] RPMS/x86_64/kernel-vanilla-3.15.0-1.1.g9194b64.x86_64.rpm
[  465s] RPMS/x86_64/kernel-vanilla-devel-3.15.0-1.1.g9194b64.x86_64.rpm
[  465s] SRPMS/pesign-repackage-1.0-1.1.src.rpm
[  465s] SRPMS/kernel-vanilla-3.15.0-1.1.g9194b64.nosrc.rpm


Cheers Glenn

I see in factory
http://ftp5.gwdg.de/pub/opensuse/factory/repo/oss/suse/x86_64/kernel-desktop-3.15.rc7-1.2.x86_64.rpm
