From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: The...  reiser4 with no ambiguity
Date: Sun, 14 Dec 2008 22:17:04 +0300
Message-ID: <49455BB0.7000300@gmail.com>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <49405D98.7000402@gmx.de> <4941467B.30308@gmail.com> <49414FC3.1040206@gmx.de> <494157FD.5020708@gmail.com> <ghroan$2e2$1@ger.gmane.org> <49419A90.4020906@gmail.com> <ghu32e$nqp$1@ger.gmane.org> <49440D64.9050900@gmail.com> <gi38gg$56v$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <gi38gg$56v$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralph Ulrich <eulenreich@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

Ralph Ulrich wrote:
> Edward Shishkin Samstag 13 Dezember 2008 20:30:
>   
>> I don't know such vfs doctrine. Who is the keeper of this doctrine?
>> :-)))
>>     
> Please, do not be too ironicle here, because I am not an insider and english is not my motherlanguage. I meant there was a discussion that in the linux mainline kernel there should not be a filesystem which has files that can have files. A file as directory was introduced to unifiy namespace by namesys. 
>
>   
>> Subfiles mean one more step in the procedure of name resolution.
>> You should return an allocated inode to vfs for every such subfile.
>> So subfiles also can not be hidden. There is a temptation to cheat
>> vfs, so it will think that it deals with usual files, but such
>> cheating doesn't lead to happy end..
>>
>> xattrs is ugly, but working solution,
>> subfiles are nice, but it doesn't work.. ;)
>>     
>
> First of all I have to understand reiser4 with no ambiguity:
>
> Are reiser4 file-plugins _only_ to handle data effective at low-level (like your compression plugin).

Nop.

There can be new features, which
. come from vfs;
. are not related to data storage improvements;
. require a new reiser4 plugin.

A good example - xattrs.

>  I know you stress this quiet often in your mails. Or is it just your focussing for now to get reiser4 mainline?
>
> Is it not possible to introduce new extended features in reiser4 and hide these features vfs? 
>   

Yes, it is possible, but, again, those features should implement
some new (optimal, efficient, safe, reliable, etc.) form of data storage.

> In reiser4 there is no such possibility to introduce a new kind of file which is hidden from vfs?
>   

Yes, it is. For example, there are two regular file plugins in reiser4.
Both are intensively used, but vfs doesn't know about them.

> Semantics of reiser5 are totally out of scope here, but I thought of them as implementable above/on reiser4

Yes, I have pushed some technical concepts of r5 to r4 a year ago..

>  - reiser4 as the technical grounds for reiser5 (as announced by namesys).
>
> Ralph
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

