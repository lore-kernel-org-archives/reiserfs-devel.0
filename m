From: Hans Reiser <reiser@namesys.com>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Thu, 04 Mar 2004 03:10:17 +0300
Message-ID: <404673E9.30602@namesys.com>
References: <4044119D.6050502@andrew.cmu.edu> <4044366B.3000405@namesys.com> <4044B787.7080301@andrew.cmu.edu> <1078266793.8582.24.camel@mentor.gurulabs.com> <20040302224758.GK19111@khan.acc.umu.se> <40453538.8050103@animezone.org> <20040303014115.GP19111@khan.acc.umu.se> <20040303014115.GP19111@khan.acc.umu.se.suse.lists.linux.kernel> <p73ptbu4psx.fsf@brahms.suse.de> <20040303074756.A25861@infradead.org> <40459159.1090501@namesys.com> <871xo97sb7.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17060-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <871xo97sb7.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

Hubert Chan wrote:

>(only sent to ReiserFS list)
>
>  
>
>>>>>>"Hans" == Hans Reiser <reiser@namesys.com> writes:
>>>>>>            
>>>>>>
>
>[...]
>
>Hans> I think V4 will be our last rewrite from scratch because of our
>Hans> plugins, and because of how easy we find the code to work on now.
>
>What about the on-disk filesystem format?  Will Reiser5 and Reiser6
>have some sort of backward compatability?  Can it all be done using
>plugins?
>
>  
>
Yes, Reiser6 semantics will be implemented using additional plugins for 
directories, etc.

-- 
Hans


