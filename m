From: Yury Umanets <umka@namesys.com>
Subject: Re: build problem BK reiser4progs: /usr/include/features.h:218:52:
 operator '==' has no left operand
Date: Thu, 16 Jan 2003 22:51:58 +0300
Message-ID: <3E270D5E.7080808@namesys.com>
References: <20030116140405.P7526@humilis> <3E26B263.2000909@namesys.com> <20030116145519.Q7526@humilis> <3E26BBF8.40003@namesys.com> <20030116190044.R7526@humilis> <3E26F4F3.5080801@namesys.com> <20030116192854.S7526@humilis> <3E26FD74.2080008@namesys.com> <20030116200305.T7526@humilis> <3E27055B.4090706@namesys.com> <20030116204131.V7526@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12411-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030116204131.V7526@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ookhoi@humilis.net
Cc: Reiserfs-List <reiserfs-list@namesys.com>

Ookhoi wrote:

>Yury Umanets wrote (ao):
>  
>
>>Ookhoi wrote:
>>    
>>
>>>Yury Umanets wrote (ao):
>>>      
>>>
>>>>The cure ptobably is to install more recent libtool.
>>>>        
>>>>
>>>Oke, I'll search for a more recent one. I do run an up to date debian
>>>sid (unstable) though. Hm :-)
>>>
>>>ookhoi $ libtool --version
>>>ltmain.sh (GNU libtool) 1.4.3 (1.922.2.111 2002/10/23 02:54:36)
>>>
>>>      
>>>
>>libtool --version
>>ltmain.sh (GNU libtool) 1.4.2 (1.922.2.53 2001/09/11 03:18:52)
>>
>>    
>>
>>>I'll report success or failure. Thanks!
>>>      
>>>
>>Thanks to you :) I'll find the cure :)
>>    
>>
>
>Hope so :-)  Though, my libtool is the most recent, according to
>http://www.gnu.org/software/libtool/libtool.html
>
>The alpha version is not downloadable (the dir libtool doesn't exist),
>and I can't seem to build the cvs version.
>
>But, are you able to build it successful? With what tool versions if I
>may ask?
>
>
>  
>
Yes, I'm able to build it. I'd say, currently you are one man 
reiser4progs can't be built on box. And I don't know why :) Actulally, 
log you've sent me contains intersting line:

checking how to recognise dependent libraries... unknown

????

I don't know what is it :)

-- 
Yury Umanets


