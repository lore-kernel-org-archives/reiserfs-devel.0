From: Spam <spam@tnonline.net>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 6 Jan 2005 17:13:23 +0100
Message-ID: <1967462673.20050106171323@tnonline.net>
References: <20041228221218.GA6412@schmorp.de>
 <20050106124505.GE5352@backtop.namesys.com> <20050106142706.GE519@schmorp.de>
 <41DD5FA9.5020800@namesys.com>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41DD5FA9.5020800@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>>>>generic bug in handling hash collisions?
>>>>      
>>>>
>>>Tea hash is designed to be more resistant.  
>>>    
>>>
>>
>>As the example posted shows, tea doesn't look better, it generates
>>nicely-looking collisions, too.
>>  
>>
> You mean, in practice you hit them, or with an artificially generated
> set of filenames intended to cause collisions you get those collisions?

 Excuse me, but do you mean that there are undocumented limits on what
 files can be named to, and how many files with similar or random
 names in a ReiferFS volume?

 This sounds bad...

