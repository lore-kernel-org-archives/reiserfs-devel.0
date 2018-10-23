From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: Reiser4 Linux 4.17.19-1 hangs in Google cloud VM, too.
Date: Tue, 23 Oct 2018 04:38:52 +0100
Message-ID: <20181023033852.GR32577@ZenIV.linux.org.uk>
References: <20181022101912.3CE2E292B005@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181022101912.3CE2E292B005@huitzilopochtli.metztli-it.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Metztli Information Technology <jose.r.r@metztli.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 22, 2018 at 03:19:12AM -0700, Metztli Information Technology wrote:
> I installed reiser4 -enhanced Linux kernel 4.17.19-1 --thus replacing the prior hung reiser4 -patched kernel 4.18.15-1 in the Google Compute Engine (GCE) cloud instance. After less than 24 hours the 4.17.19-1 hung in similar way to the 4.18.15-1.
> 
> Please note that I had been running my custom Metztli Reiser4 Debian Stretch image with reiser4 linux 4.14.20-1 without issues for several months
> < https://github.com/Metztli/reiser4-debian-kernel-packaging-4.14.20 >  --until I decided to upgrade to newer kernel(s).

Er...  Does anybody maintain reiser4 these days?  I can't recall a single mail
along the lines of "such-and-such VFS/VM/scheduler/etc. change would break reiser4"
in quite a few years (more than a decade, most likely)...
