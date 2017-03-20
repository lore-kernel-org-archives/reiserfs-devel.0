From: Ross Vandegrift <ross@kallisti.us>
Subject: Re: [E-devel] EFL 1.19.0-beta3 (from git) package for Debian
 Experimental
Date: Mon, 20 Mar 2017 16:19:39 -0400
Message-ID: <20170320201511.lbmu27zod7buhbcg@vanvanmojo.kallisti.us>
References: <CAM12Q5SCMgk=W0C-==XKzF4bo8CFh-y3QJWfXGcTAD2tV1mJAw@mail.gmail.com>
Reply-To: Enlightenment developer list
	<enlightenment-devel@lists.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <enlightenment-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <CAM12Q5SCMgk=W0C-==XKzF4bo8CFh-y3QJWfXGcTAD2tV1mJAw@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/enlightenment-devel>,
	<mailto:enlightenment-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=enlightenment-devel>
List-Post: <mailto:enlightenment-devel@lists.sourceforge.net>
List-Help: <mailto:enlightenment-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/enlightenment-devel>,
	<mailto:enlightenment-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: enlightenment-devel-bounces@lists.sourceforge.net
To: Enlightenment developer list <enlightenment-devel@lists.sourceforge.net>
Cc: debian-devel@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Sun, Mar 19, 2017 at 11:47:39PM -0700, Jose R R wrote:
> https://git.enlightenment.org/core/efl.git/
> 
> Notwithstanding, I intended to package Enlightenment and make download
> available for my SourceForge Debian-Reiser4 netboot installer.
> 
> EFL debian packaging:
> http://http.debian.net/debian/pool/main/e/efl/efl_1.18.4-1.debian.tar.xz

Any reason you want to rebuild from git instead of using the packages in
experimental?  If you've found a problem, I'd like to fix it.  On sid &
stretch they should install without difficulty.

Are you using sbuild?  I've seen issues like the test failures below
under sbuild - some EFL tests get incorrect info about filesystem
permissions.  I use pbuilder, so I haven't tracked this down.

Ross

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
