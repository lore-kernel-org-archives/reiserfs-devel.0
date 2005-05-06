From: Andrew Clausen <clausen@gnu.org>
Subject: Re: Reiser4 support on parted ...
Date: Fri, 6 May 2005 10:02:08 +1000
Message-ID: <20050506000208.GE8179@gnu.org>
References: <427A0834.7080201@futuretg.com> <427A99C0.2000105@slaphack.com> <20050505221204.GC8179@gnu.org> <427AA6CF.6000505@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <427AA6CF.6000505@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Thu, May 05, 2005 at 06:05:51PM -0500, David Masover wrote:
> Couldn't this just be a wrapper to mkfs.reiser4 and fsck.reiser4?

Almost.

As it stands, libparted can't delegate out I/O to external programs,
because its filesystem API address in terms of disk sectors rather
than partitions.  libparted could be improved to map sectors back
to partitions for external communication, though.
(I wonder if clever use of devicemapper could make this very simple?)

Also, error handling (especially with i18n) could be somewhat painful
with this approach.

Cheers,
Andrew

