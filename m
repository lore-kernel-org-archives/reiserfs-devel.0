From: Hans Reiser <reiser@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Wed, 09 Aug 2006 02:37:45 -0600
Message-ID: <44D99ED9.1030003@namesys.com>
References: <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl> <44CF87E6.1050004@slaphack.com> <20060806225912.GC4205@ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29550-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060806225912.GC4205@ucw.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: David Masover <ninja@slaphack.com>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, Bernd Schubert <bernd-schubert@gmx.de>, reiserfs-list@namesys.com, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Clay Barnes <clay.barnes@gmail.com>, Rudy Zijlstra <rudy@edsons.demon.nl>, Adrian Ulrich <reiser4@blinkenlights.ch>, ipso@snappymail.ca, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

Pavel Machek wrote:

>
>
>Yes, I'm afraid redundancy/checksums kill write speed,
>
they kill write speed to cache, but not to disk....  our compression
plugin is faster than the uncompressed plugin.....

