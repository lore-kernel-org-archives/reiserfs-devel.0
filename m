From: Toby Thain <toby@smartgames.ca>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Tue, 1 Aug 2006 00:31:03 +0400
Message-ID: <91119F99-233E-4790-95E5-FD3361F92B59@smartgames.ca>
References: <200607311918.k6VJIqTN011066@laptop13.inf.utfsm.cl>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29325-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607311918.k6VJIqTN011066@laptop13.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: "Horst H.von Brand" <vonbrand@inf.utfsm.cl>
Cc: ReiserFS List <reiserfs-list@namesys.com>


On 31-Jul-06, at 11:18 PM, Horst H. von Brand wrote:

> Adrian Ulrich <reiser4@blinkenlights.ch> wrote:
>
> [...]
>
>> ZFS uses 'dnodes'. The dnodes are allocated on demand from your
>> available space so running out of [di]nodes is impossible.
>>
>> Great to see that Sun ships a state-of-the-art Filesystem with
>> Solaris... I think linux should do the same...
>
> This would be worthwhile, if only to be able to futz around in  
> Solaris-made
> filesystems.
>
> Are you volunteering? You'd probably need a friend in Solaris-land who
> passes you information on how things are done, and copies of  
> filessytems to
> take apart, and so on.
>
> First question is if there are any restrictions (patent or  
> otherwise) on
> doing this, just copying is out of the question due to (unfortunate)
> licence on Sun's part.

This may eventually be good enough for "futzing around":
http://zfs-on-fuse.blogspot.com/



> -- 
> Dr. Horst H. von Brand                   User #22616 counter.li.org
> Departamento de Informatica                     Fono: +56 32 654431
> Universidad Tecnica Federico Santa Maria              +56 32 654239
> Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513

