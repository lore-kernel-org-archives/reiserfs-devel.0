From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: minor and major locality of key in reiser4
Date: Mon, 27 Dec 2004 18:58:04 +0300
Message-ID: <1104163083.3574.67.camel@tribesman.namesys.com>
References: <20041227101224.12746.qmail@web60107.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22913-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041227101224.12746.qmail@web60107.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pallavi Dalya <pallavidalya@yahoo.com>
Cc: reiser-list mailing <reiserfs-list@namesys.com>

Hello

On Mon, 2004-12-27 at 13:12, Pallavi Dalya wrote:
> hello,
>       The tree in reiser4 is fully ordered by a key. What information
> do we  aggregate in the key so that later the information can be
> segregated from it. What is minor and major locality packing of the
> key.

major locality is by default objectid of directory.
it occupies highest 60 bits of first key component.

minor locality occupies lowest 4 bits of first key component.
it displaces valious data of file: file name, stat data (analog of
on-disk inode), file data.

 

>  
> The key is defined as
>  
> union reiser4_key{
>  
> d64 el[KEY_LAST_INDEX];
> int pad;
> };
>  
> Its specified that KEY_LAST_INDEX has the value of three. Where is
> this defined.

sorry, I am not sure what do you mean.
KEY_LAST_INDEX is defined in reiser4/key.h.
it is last value of reiser4_key_field_index enum.
>  
>  
> Pallavi
> 
> 
> ______________________________________________________________________
>  Yahoo! Messenger - Communicate instantly..."Ping" your friends today!
> Download Messenger Now

