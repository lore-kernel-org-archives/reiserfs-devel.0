From: Hans Reiser <reiser@namesys.com>
Subject: Re:  2.6.9-mm1
Date: Sat, 23 Oct 2004 13:28:50 -0700
Message-ID: <417ABF02.4030705@namesys.com>
References: <20041022032039.730eb226.akpm@osdl.org>    <4179425A.3080903@namesys.com> <1078.217.232.234.250.1098558101.squirrel@florka.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078.217.232.234.250.1098558101.squirrel@florka.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: marcel@hilzinger.hu
Cc: Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, Reiserfs developers mail-list <reiserfs-dev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hilzinger Marcel wrote:

>
>Too late, perhaps... SuSE Linux 9.2 will contain reiser4 (at least the
>beta testversions did). It cannot be set up via YaST during installation,
>  
>
which makes its user base pretty small. 9.3 is where we will probably 
get a lot of users. Probably more bugs will get found by the SuSE QA 
team in the next few weeks though, and that should help us.

The one I am wanting to precede regarding shipping is Lindows where we 
will be the default. Reiser4 is pretty stable now, but if we got into 
the kernel now we'd have a few weeks of bug finding before they ship, 
and I just bet there will be a few bugs found as a result (not frequent 
ones, but....) that several of their users would be happy to not hit. 
The official kernel has the advantage of a far faster test and fix time 
cycle than a distro, and has more sophisticated users. The reason for 
features going into distros first is not technical, and sad.

Hans
