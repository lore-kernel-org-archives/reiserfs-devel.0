From: Erik Terpstra <erik@solidcode.net>
Subject: Can compression at filesystem level improve overall performance?
Date: Fri, 19 Mar 2004 15:25:49 +0100
Message-ID: <405B02ED.4010602@solidcode.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17321-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello everyone,

For the last couple of years I noticed that the performance of most of 
my systems has it's bottleneck in data throughput rather than CPU 
performance.

Is it fair to say that today compression at the filesystem level would 
improve overall performance?

If this is the case, it probably wouldn't be too hard to implement as a 
module in Reiser4?

Any thoughts?

--Erik.
