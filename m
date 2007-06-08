From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 33/39] reiserfs: split right balancing part of	balance_leaf()
 off
Date: Thu, 07 Jun 2007 21:28:55 -0400
Message-ID: <4668B0D7.3050100@suse.com>
References: <20070530220511.681688471@mail.jeffreymahoney.com>	 <20070530222101.190219224@mail.jeffreymahoney.com>	 <4668805C.2070408@namesys.com>  <46688053.4050409@suse.com> <1181257975.21257.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1181257975.21257.9.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zan Lynx <zlynx@acm.org>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Zan Lynx wrote:
> On Thu, 2007-06-07 at 18:01 -0400, Jeff Mahoney wrote:
>> Vladimir V. Saveliev wrote:
> [cut] 
>>> shouldn't function name prefixes be more consistent? Either bl_ or
>>> balance_leaf everywhere?
>>>
>> Yes, absolutely. Initially they were, but
>> balance_leaf_function_subfunction(parameter list) ended up with the
>> parameters grouped along the right margin. I wouldn't be opposed to
>> changing them all to bl_* except for balance_leaf itself.
> 
> Or you could trade vertical space for horizontal space and do like:
> 
> static void
> balance_leaf_right_paste_de_partial(
> 	struct tree_balance *tb, struct item_head *ih,
> 	const char *body, int flag, int *zeros_num,
> 	int item_pos, int *pos_in_item
> ) {
> 
> I always thought wasting all that horizontal space in parameter lists
> was silly just to save some vertical, and so many people get the
> tab-stop/space mix wrong.

Well, I actually meant with the call sites, where the start of the
funciton call is already two or three tab stops in. The next revision
uses bl_* for all of them.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFGaLDXLPWxlyuTD7IRArMUAJ49r+82Hbj7TpHZOAIf3q1z3egV5ACeN+IH
iJroW0vmxIY1I6fiNDy/Dyg=
=p/e1
-----END PGP SIGNATURE-----
