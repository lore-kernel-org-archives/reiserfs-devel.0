From: Yury Umanets <umka@namesys.com>
Subject: Re: aal_assert()
Date: Fri, 10 Jan 2003 16:19:42 +0300
Message-ID: <3E1EC86E.4070505@namesys.com>
References: <20021231005440.GA1573@gnu.org> <15901.23872.24060.68353@laputa.namesys.com> <20030110132628.GA1056@gnu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12306-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030110132628.GA1056@gnu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Clausen <clausen@gnu.org>
Cc: Nikita Danilov <Nikita@Namesys.COM>, reiserfs-list@namesys.com

Andrew Clausen wrote:

>On Thu, Jan 09, 2003 at 02:30:08PM +0300, Nikita Danilov wrote:
>  
>
>>These "message ids" are traditional way reiserfs code uses to identify
>>errors (probably because early during development preprocessor features
>>were unknown) and Hans feels himself attached to them emotionally. :-)
>>    
>>

>Well, I'll give some arguments against this scheme:
>
>(1) it's more code, more work, more space, etc.  Programmers are
>minimalists, and adding extra stuff feels dirty.
>
>(2) "ids" are the Wrong Way to identify things... things should
>be identified by their essence, not by tags.  This is the whole
>OO vs relational database flamewar.  Relational databases
>(the "by essense/being, not tag") won, game over.
>
>You don't query things by tags, but by what they are.
>
>I know this is all quite subjective... I just wanted to provide
>some emotional arguments as well as rational ones *grin*
>

>
>Another thing: I'd like to see libaal reused in all file system
>tool implementations.  That's my main motivation for cleaning it
>up.  My first target is ntfs...
>
It is more reasonable. Probably Hans will agree with you because of this.

>
>Cheers,
>Andrew
>
>
>
>  
>


-- 
Yury Umanets


