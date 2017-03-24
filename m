From: Jose R R <jose.r.r@metztli.com>
Subject: Re: [E-devel] EFL 1.19.0-beta3 (from git) package for Debian
	Experimental
Date: Fri, 24 Mar 2017 05:24:28 -0700
Message-ID: <CAM12Q5Rh5dqgJ-OXMnO8R0kk3xFuNcrsO4EBkpvN78vHgd=FxA@mail.gmail.com>
References: <CAM12Q5SCMgk=W0C-==XKzF4bo8CFh-y3QJWfXGcTAD2tV1mJAw@mail.gmail.com>
	<20170320201511.lbmu27zod7buhbcg@vanvanmojo.kallisti.us>
	<CAM12Q5TZqe2WiZXQniYQy_zTArGDsbUgaDujaKTaiYyYMskT9Q@mail.gmail.com>
	<20170321235542.bz3kyjs6fvl5yyrg@stgulik>
	<CAM12Q5QJUfF+sLdL6-hipQi610jAHfqY_dNsBG7POFVteqRh5A@mail.gmail.com>
	<20170323125510.3w5ov7rr226662m4@vanvanmojo.kallisti.us>
Reply-To: Enlightenment developer list
	<enlightenment-devel@lists.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <enlightenment-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20170323125510.3w5ov7rr226662m4@vanvanmojo.kallisti.us>
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

On Thu, Mar 23, 2017 at 5:55 AM, Ross Vandegrift <ross@kallisti.us> wrote:
> On Wed, Mar 22, 2017 at 04:50:38AM -0700, Jose R R wrote:
>> First I modify debian/rules, option: --enable-fb
>>
-------------------------------------------------------------------------------------------------------------------------------------------------
>> [...]
>> ifeq (linux,$(DEB_HOST_ARCH_OS))
>>         arch_flags += --enable-fb    <=## Directive is overlooked. DEB
>> build fails *because* it's missing
>> [...]
>> override_dh_auto_configure:
>>         dh_auto_configure --verbose -- \
>>         [...]
>>         --enable-fb \       <=## Added explicitly here, satisfies
dh_install
>>         $(arch_flags)
>> [...]
>>
------------------------------------------------------------------------------------------------------------------------------------------------
>
> You only need this change because you're calling debian/rules directly.
> If you use dpkg-buildpackage then DEB_HOST_ARCH_OS will be set, and the
> Makefile will automatically add --enable-fb.
>

Until recently I followed Debian Handbook debian/rules 'directly'
guidelines for building the Debianized kernel:

https://kernel-handbook.alioth.debian.org/ch-common-tasks.html#s-common-official

--and still do for all other software I've backported; thus, I thought
build of EFL DEBs as similar.

Then I began to use dpkg-buildpackage to build my Jessie-backports of
Reiser4-patched Debian kernels due to debian/rules procedure unexpectedly
failing to build subsequently newer kernel packages.

Notwithstanding, using dpkg-buildpackage to build EFL indeed does
--enable-fb but does not build (after skipping referenced tests in this
thread) the following two packages, which using debian/rules 'directly'
*does* build (.1, of course, after dch):

efl-1.18.4-1.1-DEBs/efl-doc_1.18.4-1.1_all.deb
efl-1.18.4-1.1-DEBs/libelementary-data_1.18.4-1.1_all.deb

Probably irrelevant but just letting you know.

Anyhow, I appreciate all the helpful input from everyone involved. I was
able to build EFL DEBs and I just have to alter certain variables and/or
build environment to find a proper optimization.

Thank you all.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Debian-Reiser4 for AMD64 https://sf.net/projects/debian-reiser4/
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
