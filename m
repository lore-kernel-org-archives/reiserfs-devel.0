From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 journal replay stats
Date: Tue, 19 Oct 2004 13:21:11 -0700
Message-ID: <41757737.3050604@namesys.com>
References: <200410162209.12163.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200410162209.12163.sikkh@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Piotr Neuman <sikkh@wp.pl>
Cc: reiserfs-list@namesys.com, Clifford Beshers <clifford.beshers@lindows.com>

Piotr Neuman wrote:

>Hi
>
>This small patch is will print out nuber of transartions replied from logs 
>after a crash, quite like reiserfs 3.6 does:
>
>http://kem.p.lodz.pl/~peter/reiser4_replay_stats.patch
>
>Thanks to Nikita Danilov for guidance.
>
>
>  
>
Do the members of the list view this as useful?  I worry that to average 
persons, who don't know what a transaction is, this is vaguely scary.

Clifford, I cc'd you because your intuition is better than mine for this.

Perhaps it should say something reassuring, like "All went well in the 
filesystem aspect of recovering from what seems to have been an 
improperly shutdown or crashed system."
