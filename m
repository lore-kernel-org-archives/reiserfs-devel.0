From: Cyril Plisko <Cyril.Plisko@CloverleafComm.COM>
Subject: Fwd: Re: Specification for ReiserFS4
Date: Thu, 11 Dec 2003 08:13:44 +0200
Message-ID: <200312110813.44725.Cyril.Plisko@CloverleafComm.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16324-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List@Namesys.COM

Here is some additional details on FeiserFS4 spec.

See below.

 > Thanx, guys
 > 
 > On Tuesday 09 December 2003 13:34, you wrote:
 > > Cyril Plisko writes:
 > >  > Anyone care to answer ?
 > >  > 
 > >  > On Wednesday 03 December 2003 18:22, Cyril Plisko wrote:
 > >  > > Hello,
 > >  > > 
 > >  > > I am interesting in numbers similar to posted in
 > >  > > http://www.namesys.com/faq.html
 > >  > > There are various characteristic figures for max values
 > >  > > for ReiserFS 3.5 and 3.6.  I cannot find such spec
 > >  > > for ReiserFS4.
 > >  > > 
 > >  > > Can someone help ?
 > > 
 > > Hello, and sorry for delay.
 > > 
 > > "Specification" for reiser4:
 > > 
 > > max number of files user can create on a single file system:  1152921504606846976   (2^60)
 > > 
 > > max number files a directory can have:                        1152921504606846976   (2^60)
 > > 
 > > max number sub-directories in a directory:                             4294967294   (2^32 - 2)
 > > 
 > > max file size[1]:                                            18446744073709551615   (2^64 - 1)
 > > 
 > > max number links to a file:                                            4294967296   (2^32)
 > > 
 > > max filesystem size[2]:                                   75557863725914323419136   (2^64 * 4096)

Ooops, this should read

     max filesystem size[2]:                                   37778931862957161709568   (2^63 * 4096)

because highest bit of the block number is reserved to distinguish
"real" block number from "fake" one. I hope users can tolerate this
limitation for a time being. :)

 > > 
 > > This is for default setup (per-directory limits are determined by
 > > directory plugin, maximal number of links is determined by stat-data
 > > plugin, etc.).
 > > 
 > > [1] Current page cache limitations effectively limit maximal file size
 > > to 2^(32 + 12) == 2^44 == 17592186044416 bytes, on 32-bit architectures,
 > > but on-disk format provides for more.
 > > 
 > > [2] Block IO sub-system currently limits device size to 2^64 * 512 ==
 > > 9444732965739290427392, but on-disk format provides for more.
 > > 
 > >  > > 
 > >  > > Regards,
 > >  > > 	Cyril
 > >  > > 
 > > 

Nikita.

 > > 



-------------------------------------------------------

-- 
/~\  The ASCII Ribbon Campaign
\ /    No HTML/RTF in email
 X     No Word docs in email
/ \  Respect for open standards

