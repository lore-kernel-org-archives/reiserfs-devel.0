From: Juergen Waiblinger <juwa@triplestor.com>
Subject: reiserfs for cluster
Date: Tue, 06 May 2003 16:13:20 +0200
Message-ID: <5.2.0.9.0.20030506160902.03b1da60@pop.puretec.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13963-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

we are running different beowulf clusters and the storage amount increases 
all the time. Until now we have been using Veritas Clusterfilesystem, but 
for different reasons we want to go for an other solution. As we are using 
reiserfs quite happily on the desktops we thought about using this for the 
storagesubsystem attached to the masterserver of the cluster.
there will only be sun and linux machines accessing the files but there 
will be concurrent file access.
Has anybody tried this or could give some other solutions
Any information will be appreciated

TIA will summarize to the list

