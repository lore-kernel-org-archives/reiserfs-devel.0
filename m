From: Oleg Drokin <green@namesys.com>
Subject: Re: Behavior of tails with respect to shred, wipe, etc
Date: Fri, 25 Oct 2002 20:00:14 +0400
Message-ID: <20021025200014.A1763@namesys.com>
References: <HDEFILEPHCPLCAGPLCEMIELIDFAA.icycle@charter.net> <15801.26994.705639.374241@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11777-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15801.26994.705639.374241@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Brett Russ <icycle@charter.net>, Reiserfs-List <reiserfs-list@namesys.com>

Hello!

On Fri, Oct 25, 2002 at 07:55:30PM +0400, Nikita Danilov wrote:

>  > 2) If someone confirms that there is not a way to guarantee obliteration of
>  > original data in all cases with tails, can I assume that disabling tails
>  > will rectify the problem?
> I think yes. Reiserfs neither relocates nor journals unformatted blocks
> (until data-journalling patches are used).

Actually this is only true if file was not truncated prior to overwrite.

> I guess we should address this issue in reiser4. This is -security-
> feature after all. Hans? It is not clear how to intehgrate this with
> journalling though.

Zero out all freed blocks (mount option). This will kill write performance
though.

Bye,
    Oleg
