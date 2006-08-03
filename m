From: Theodore Tso <tytso@mit.edu>
Subject: Re: reiser4: maybe just fix bugs?
Date: Thu, 3 Aug 2006 03:46:51 -0400
Message-ID: <20060803074651.GA27835@thunk.org>
References: <1158166a0607310226m5e134307o8c6bedd1f883479c@mail.gmail.com> <20060801013104.f7557fb1.akpm@osdl.org> <44CEBA0A.3060206@namesys.com> <1154431477.10043.55.camel@tribesman.namesys.com> <20060801073316.ee77036e.akpm@osdl.org> <1154444822.10043.106.camel@tribesman.namesys.com> <44CF879D.1000803@slaphack.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932375AbWHCHrS@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <44CF879D.1000803@slaphack.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, Andrew Morton <akpm@osdl.org>, vda.linux@googlemail.com, linux-kernel@vger.kernel.org, Reiserfs-List@namesys.com

On Tue, Aug 01, 2006 at 11:55:57AM -0500, David Masover wrote:
> 
> If I understand it right, the original Reiser4 model of file metadata is 
> the file-as-directory stuff that caused such a furor the last big push 
> for inclusion (search for "Silent semantic changes in Reiser4"):

The furor was caused by concerns Al Viro expressed about
locking/deadlock issues that reiser4 introduced.  

The bigger issue with xattr support is two-fold.  First of all, there
are the progams that are expecting the existing extended attribute
interface, and not implementing it will simply mean that as far as
Samba, and other applications, Reiser4 simply will not haved xattr
support.

More importantly are the system-level extended attributes, such as
those used by SELINUX, which by definition are not supposed to be
visible to the user at all, but only are supposed to be there for the
SELINUX (or some other kernel layer, in general) to access.   

Not supporting xattrs means that those distro's that use SELINUX by
default (i.e., RHEL, Fedora, etc.) won't want to use reiser4, because
SELINUX won't work on reiser4 filesytstems.

Whether or not Hans cares about this is up to him....

						- Ted
