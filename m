From: Ookhoi <ookhoi@humilis.net>
Subject: Re: build problem BK reiser4progs: /usr/include/features.h:218:52: operator '==' has no left operand
Date: Thu, 16 Jan 2003 19:00:44 +0100
Message-ID: <20030116190044.R7526@humilis>
References: <20030116121007.L7526@humilis> <3E269499.2090909@namesys.com> <20030116123949.N7526@humilis> <3E26A2A6.702@namesys.com> <20030116133100.O7526@humilis> <3E26A821.4060006@namesys.com> <20030116140405.P7526@humilis> <3E26B263.2000909@namesys.com> <20030116145519.Q7526@humilis> <3E26BBF8.40003@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12403-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E26BBF8.40003@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yury Umanets <umka@namesys.com>
Cc: ookhoi@humilis.net, Reiserfs-List <reiserfs-list@namesys.com>

Hi Yury,

I'm sorry for the sudden leave and the delayed reply.

Yury Umanets wrote (ao):
> Ookhoi wrote:
> >I don't have a libreiser4.so on the system. Closest to that is
> >/usr/local/lib/libreiser4.a  Is that oke?
> >
> No, it is not nornal case. It is pretty strange. Try the fllowing
> sequence:
> bk pull
> aclocall && autoheader && aitomake --add-missing && autoconf
> ./configure
> make distclean
> ./configure
> make
> make install
> ldconfig -v | grep reiser4
>
> And let's see what happen

# ldconfig -v | grep reiser4
#

Empty (after fresh pull). I can provide the output of all the above
commands if you like (it's a bit large). Would that help you?
