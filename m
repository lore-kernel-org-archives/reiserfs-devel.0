From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Application Problems with Reiser4/19.01.2004-fixed
Date: Fri, 23 Jan 2004 15:09:40 +0300
Message-ID: <16401.3844.21706.388236@laputa.namesys.com>
References: <4010218C.9090006@gmx.at>
	<16400.65481.167302.617050@laputa.namesys.com>
	<40110710.4070100@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40110710.4070100@gmx.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Willi W." <willi.w@gmx.at>
Cc: reiserfs-list@namesys.com

Willi W. writes:
 > Nikita Danilov wrote:
 > 
 > > > * overnet cannot reload shared data from the reiser4 partition.
 > >
 > > > * azureus (a java bittorrent client) has hash problems all the time when 
 > >
 > >What are these application, and where can we obtain them from?
 > >  
 > >
 > overnet, small binary, closed source from 
 > http://download.overnet.com/overnet0.51.2.tar.gz for downloading edonkey 
 > files

Hmm... can you run overnet under strace (up to the failure) and send the
output to me?

 > 
 > azureus, java app, opensource from http://azureus.sourceforge.net/ for 
 > downloading bittorrent files (google: bittorrent)
 > 
 > both store parts of downloaded (p2p) data in files.

Nikita.
