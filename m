From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: reiserfs v3 vs v4 bonnie++ benchmarks
Date: Thu, 25 Mar 2004 15:35:02 -0800
Message-ID: <40636CA6.6060708@matchmail.com>
References: <Pine.LNX.4.58L0.0403091811140.5982@ahriman.bucharest.roedu.net> <404DFACE.4090008@namesys.com> <Pine.LNX.4.58L0.0403091914240.8537@ahriman.bucharest.roedu.net> <404DFDBA.8040006@namesys.com> <Pine.LNX.4.58L0.0403091929530.9967@ahriman.bucharest.roedu.net> <404E0112.7080904@namesys.com> <Pine.LNX.4.58L0.0403092308420.17447@ahriman.bucharest.roedu.net> <404EB6C7.9000909@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17484-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <404EB6C7.9000909@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Mihai RUSU <dizzy@roedu.net>, reiserfs-list@namesys.com, Yann Dupont <Yann.Dupont@univ-nantes.fr>

Hans Reiser wrote:
 > Yann, I think you will get the same effect if you repeat with 10x larger
 > fileset.  Reiser4 is not tuned for size of ram benchmarks, and I don't
 > think it should be.

Hans, first of all, can you please trim the areas of a message you quote 
(especially after the area you're quoting if you don't write anything 
below...)?  It would make reading your replies much easier.

And second, the tuning isn't important now, especially since reiser4 
hasn't made it into -mm yet, but it should definitely be on the to-do 
list, just way down below stability, and "get into -mm".

Mike
