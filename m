From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] rename configure.in -> configure.ac
Date: Fri, 19 Oct 2012 01:14:33 -0400
Message-ID: <1350623673-11174-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Newer autotools complains if you use the old style name.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 configure.in => configure.ac | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename configure.in => configure.ac (100%)

diff --git a/configure.in b/configure.ac
similarity index 100%
rename from configure.in
rename to configure.ac
-- 
1.7.12

