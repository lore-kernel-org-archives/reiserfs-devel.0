From: Louis-David Mitterrand <vindex+lists-reiserfs-list@apartia.org>
Subject: is quotacheck slow with reiserfs
Date: Thu, 5 Oct 2006 22:34:45 +0200
Message-ID: <20061005203445.GA7650@apartia.fr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30005-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

On a 200-user mail server with a 500gb reiser3 fs, quotacheck takes an 
hour at boot time. This is a mail server with 200 users. 

Is that normal? Is there a way to speed it up?

Thanks,
