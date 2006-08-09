From: Pavel Machek <pavel@suse.cz>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Wed, 9 Aug 2006 11:48:13 +0200
Message-ID: <20060809094813.GE3308@elf.ucw.cz>
References: <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl> <44CF87E6.1050004@slaphack.com> <20060806225912.GC4205@ucw.cz> <44D99ED9.1030003@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44D99ED9.1030003@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, Bernd Schubert <bernd-schubert@gmx.de>, reiserfs-list@namesys.com, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Clay Barnes <clay.barnes@gmail.com>, Rudy Zijlstra <rudy@edsons.demon.nl>, Adrian Ulrich <reiser4@blinkenlights.ch>, ipso@snappymail.ca, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

On Wed 2006-08-09 02:37:45, Hans Reiser wrote:
> Pavel Machek wrote:
> 
> >
> >
> >Yes, I'm afraid redundancy/checksums kill write speed,
> >
> they kill write speed to cache, but not to disk....  our compression
> plugin is faster than the uncompressed plugin.....

Yes, you can get clever. But your compression plugin also means that
single bit error means whole block is lost, so there _is_ speed
vs. stability-against-hw-problems.

But you are right that compression will catch same class of errors
checksums will, so that it is probably good thing w.r.t. stability.

								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
