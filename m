From: Hans Reiser <reiser@namesys.com>
Subject: Re: Multiple data streams...
Date: Thu, 03 Apr 2003 23:50:57 +0400
Message-ID: <3E8C90A1.1010305@namesys.com>
References: <6167696812.20030402112847@tnonline.net>	 <3E8B0BED.2070004@suse.com>	<3E8B1572.1010001@namesys.com>	 <1049303242.15216.1023.camel@tiny.suse.com>	 <16011.6694.600468.304009@laputa.namesys.com>	 <3E8C7F64.8020008@namesys.com> <1049396559.15217.1127.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13558-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1049396559.15217.1127.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Jeff Mahoney <jeffm@suse.com>, Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

Chris Mason wrote:

>
>I know that you were concerned about the v3 acl support being a
>compatibility problem in v4, but given the acls/xattrs can easily be
>exported to a neutral format and then reimported into whatever v4
>supports, I don't think it will be a problem.  If it is, we'll work with
>you to help fix it.
>
>
>  
>
We will both work to ensure problems are kept small in this area, and I 
think it is best to spend our time coding rather than worrying about 
this when we are not at any decision point in the process.   Hopefully 
it will not be substantive as a problem.

-- 
Hans


