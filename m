From: Hans Reiser <reiser@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 06 Jan 2005 07:56:25 -0800
Message-ID: <41DD5FA9.5020800@namesys.com>
References: <20041228221218.GA6412@schmorp.de> <20050106124505.GE5352@backtop.namesys.com> <20050106142706.GE519@schmorp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050106142706.GE519@schmorp.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Alex Zarochentsev <zam@namesys.com>, stefan@hello-penguin.com

pcg( Marc)@goof(A.).(Lehmann )com wrote:

>On Thu, Jan 06, 2005 at 03:45:06PM +0300, Alex Zarochentsev <zam@namesys.com> wrote:
>  
>
>>>generic bug in handling hash collisions?
>>>      
>>>
>>Tea hash is designed to be more resistant.  
>>    
>>
>
>As the example posted shows, tea doesn't look better, it generates
>nicely-looking collisions, too.
>  
>
You mean, in practice you hit them, or with an artificially generated 
set of filenames intended to cause collisions you get those collisions?

