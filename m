From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 21:22:08 +0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <16690.4288.260815.847844@thebsh.namesys.com>
References: <1732169380.20040827224404@tnonline.net>
	<200408291521.i7TFLsQk028363@localhost.localdomain>
	<10558145.20040829185217@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <10558145.20040829185217@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Spam <spam@tnonline.net>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Hans Reiser <reiser@namesys.com>, Helge Hafting <helgehaf@aitel.hist.no>, Rik van Riel <riel@redhat.com>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

Spam writes:
 > 
 > > Spam <spam@tnonline.net> said:
 > >> Horst von Brand <vonbrand@inf.utfsm.cl> said:

[...]

 > 
 > > Show benefits, show there are no downsides. Show that the same can't
 > > possibly be done in userland. Then I'll consider buying it.
 > 
 >   I am not saying it couldn't be done in userland. Most things can.
 > 
 >   The  problem with userland is that it doesn't provide generic access
 >   across  most  applications. For example GnomeVFS is limited to Gnome
 >   applications  only.  The  same  for  KDE.  to  be able to coordinate
 >   application developer on anything is just almost impossible.

Hmm... drag-and-drop also doesn't work constently over all
applications. Let's put it into kernel.

Seriously, kernel prformance is critical to the system, and to achieve
high performance all kernel code runs in single address space (actually,
in portion of address spaces of user processes shared by all
processes). All shared system state is located there. This means that
bug in a kernel affects whole system. This means that kernel should be
kept as simple as possible (and a bit more simple).

This is why only things that cannot be done efficiently in the user
level are put into kernel. And political agendas of various camps of
user-level developers change nothing here.

 > 
 >   Still.  Why do you oppose plugins, streams and meta files? The could
 >   be   valuable   and  easy  to use tools for many purposes. One could
 >   be  would be advanced ACLs defined as a meta-file using XML format.

POSIX has standard ACL API in C (well, "eternal draft" only), one can
use it to extract ACLs from kernel and convert it to any format to one's
heart content. Advantage of this is that when XML goes out of fashion (I
hope this wouldn't yet happen when you will read this message), kernel
API will remain intact.

 >   

Nikita.
