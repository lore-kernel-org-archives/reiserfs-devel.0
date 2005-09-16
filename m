From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 in 2.6.14-rc1-mm1
Date: Fri, 16 Sep 2005 19:12:34 +0400
Message-ID: <432AE0E2.3070103@namesys.com>
References: <dge8vb$j9n$2@sea.gmane.org> <432ACB57.5070006@namesys.com> <dgekcf$ol3$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25993-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <dgekcf$ol3$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lexington Luthor <lexington.luthor@gmail.com>
Cc: reiserfs-list@namesys.com

Lexington Luthor wrote:

> Edward Shishkin wrote:
>
>> Hello.
>> It was possible earlier to set it per directory using pseudo-file 
>> interface,
>> but 2.6.14-rc1-mm1 does not contain it already. We will try to post and
>> update the appropriate patch, but anyway using cryptcompress plugin
>> can crash your system.
>>
>
> How stable is it?


I do not keep a track of it. As I remember mmap() is defuncted,
also loop devices on such files fails to work. Send us a private
message (CC reiserfs-dev_at_namesys_com) if you really want to
build and play with it in debug mode.

Edward.

> Last I read, namesys was aiming to have the compress plugin working in 
> reiser4 to be merged into 2.6.14 for the vanilla kernel release. Not 
> that that matters, as I use -mm mostly on my test machines.
>
> If it is possible to use it now, I would love to try - I don't mind 
> crashes on my test boxes and having ~50% more space would be great :)
>
> Regards,
> LL
>
>
>

