From: Hans Reiser <reiser@namesys.com>
Subject: Re: Behavior of tails with respect to shred, wipe,
 etc
Date: Sat, 26 Oct 2002 05:41:10 +0400
Message-ID: <3DB9F2B6.6000701@namesys.com>
References: <HDEFILEPHCPLCAGPLCEMIELIDFAA.icycle@charter.net> <15801.26994.705639.374241@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11791-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Brett Russ <icycle@charter.net>, Reiserfs-List <reiserfs-list@namesys.com>

Nikita Danilov wrote:

>
>I guess we should address this issue in reiser4. This is -security-
>feature after all. Hans? It is not clear how to intehgrate this with
>journalling though.
>
> > 
>
>Nikita.
>
>
>  
>
Use encryption.  Encryption still leaves you vulnerable to those who can 
extract the key out of the owner though.

Hans


