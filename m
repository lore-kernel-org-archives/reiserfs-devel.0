From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: lvm+loop-aes+reiserfs / iput deadlock fix
Date: Wed, 29 Jan 2003 23:34:10 +0100
Message-ID: <5.2.0.9.2.20030129233147.02056cf8@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12552-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Where does process hang this time? (press SysRQ-T, decode the output and 
send it to me) ---->
could you please tell me what is SysRQ-T? btw its a remote machine...
cheers,
greg

ps: well you say that its maybe a crypto-loop side problem, what I dont 
understand why it only came after 2.4.20-preX introduced, and it works 
absolutly without any problem on 2.4.19.


