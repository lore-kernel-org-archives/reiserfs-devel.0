From: Anton Altaparmakov <aia21@cam.ac.uk>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 09:19:32 +0100
Sender: aia21@hermes.cam.ac.uk
Message-ID: <1093594771.5994.1.camel@imp.csi.cam.ac.uk>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com>
	 <Pine.LNX.4.58.0408261101110.2304@ppc970.osdl.org>
	 <45010000.1093553046@flay>
	 <Pine.LNX.4.58.0408261348500.2304@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20886-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408261348500.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@osdl.org>
Cc: "Martin J. Bligh" <mbligh@aracnet.com>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 2004-08-26 at 21:54, Linus Torvalds wrote:
> The S_ISDIR/S_ISREG tests show real information: it shows not only user
> intent ("you should consider this a file, even if it has attributes"), but
> also whether it is a directory or a container.
> 
> And there's a real technical difference there: the streams contained
> within a file are bound to that file. The files contained within a
> directory are _independent_ of that directory. Big difference. HUGE
> difference.
> 
> So it's not confusing. If it tests as a file, you think of it as a file.  
> It may have attributes aka named streams associated with it, and you may
> be able to open those attributes by treating the file as a directory, but
> that doesn't really change the fact that it's a file.

What about the attributes/named streams of a directory though?  If you
open it as a directory, you would get the files inside the directory. 
So how do you get at the attributes and named streams of the directory
itself using this interface?

Best regards,

	Anton
-- 
Anton Altaparmakov <aia21 at cam.ac.uk> (replace at with @)
Unix Support, Computing Service, University of Cambridge, CB2 3QH, UK
Linux NTFS maintainer / IRC: #ntfs on irc.freenode.net
WWW: http://linux-ntfs.sf.net/, http://www-stu.christs.cam.ac.uk/~aia21/

