From: Hans Reiser <reiser@namesys.com>
Subject: status of reiser4
Date: Fri, 17 Dec 2004 10:18:21 -0800
Message-ID: <41C322ED.4000807@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Vladimir is working on one last bug that occurs if copy from user page 
faults on the user space process's buffer, and then we are going to 
bundle a set of patches together, send them to andrew morton, and then 
start a discussion on the changes to core kernel code that Hellweg and 
company object to that currently prevent our inclusion.

hans
