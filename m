From: Marc Perkel <marc@perkel.com>
Subject: Re: Reiser4 and ACLs
Date: Sun, 14 Aug 2005 06:41:48 -0700
Message-ID: <42FF4A1C.9030406@perkel.com>
References: <42FEC9F1.9040709@perkel.com>	<20050814080812.GA22983@king.bitgnome.net>	<42FF388F.3010506@perkel.com>	<b14e81f005081405316a06995c@mail.gmail.com> <17151.17921.996376.693013@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17151.17921.996376.693013@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com



Nikita Danilov wrote:

>Not exactly. As a matter of fact, ACL and EA support was already
>implemented in reiser4. But it used standard xattrs API to interface to
>the user-land, and it was decided that reiser4 should go sys_reiser4()
>route instead. So, it was reaped.
>
>Nikita.
>  
>

OK - now I'm confused. Why not the standard? After all - it is standard. 
And - when is this going to be included?

My background is in Netware. Netware did it right. It's permissions that 
it had 15 years ago were beyond what Linux might ever acheive. Then I 
downgraded to Windows, then I further downgraded to Linux. In fact when 
I started using linux it took me months of denial before I realized - 
this really is all there is. One user, one group - and that's all. 
Further - the ability of a user to delete files that they have no 
read/write rights to is just plain silly. In Netware if you have no 
right to a file, you not only can't delete it - you can't even list it 
in the directory. It's as if that file isn't even there.

ACLs finally restored some of this power although the implementation in 
Linux is crude at best. I thought there is a glimmer of hope that some 
day Linux will catch up to where Novell was 15 years ago. It is so 
frustrating dealing with Linux culture and VI mentality trying to get 
people to think outside the box.


-- 
Marc Perkel - marc@perkel.com

Spam Filter: http://www.junkemailfilter.com
    My Blog: http://marc.perkel.com

