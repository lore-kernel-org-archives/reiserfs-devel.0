From: Hans Reiser <reiser@namesys.com>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant
 architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Thu, 26 Aug 2004 01:48:51 -0700
Message-ID: <412DA3F3.8070607@namesys.com>
References: <Pine.LNX.4.44.0408251624540.5145-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20598-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408251624540.5145-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rik van Riel <riel@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, George Beshers <gbeshers@comcast.net>

Rik van Riel wrote:

>On Sun, 1 Aug 2004, Hans Reiser wrote:
>
>  
>
>>You can think of this as chroot on steroids.
>>    
>>
>
>Sounds like what you want is pretty much the namespace stuff
>that has been in the kernel since the early 2.4 days.
>
>No need to replicate VFS functionality inside the filesystem.
>
>  
>
It differs in that it has masks (view specifications), they scale well, 
their collection and specification is well automated, and they are 
attached to the process executable rather than in some centralized place 
(that is, they are process oriented not object oriented (traditional) 
and not centralized.  Users without root can use them and be trusted 
with the power to do so.

Hans
