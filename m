From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 3/3] reiser4: fix up compile errors when debug is on
Date: Sun, 30 Nov 2014 22:45:18 +0100
Message-ID: <547B8FEE.8080204@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090105010504010402030503"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=FSge/edzVGgeKbU+oF5WA4p7qiCKLrzwRhucdSw5yUo=;
        b=0XN6qW7SrHyxPX/Ojlsp6L7pI7koK2K7FuCSe587yMoivvQ8lyRYLW9loJVihtobbw
         hkEb9QSBCg9MpyK3lO28c0GCsY1i7w/d+jDJJz03LVtYgwVorGLJ07lbxwEyoGG1MG9r
         IyJOzfxbWi/6ZJgo2mwc6aLwTsqlVzjY9pmRx1MviDlzpeI9ysxO2zu/RK4l54vZYSIl
         Zsne+pKYbIGJYj9f2P1eG2VSDzjWa2WfAXb4YF3W5Fo2h7s8Hl0OiTGTxngQvficjd8y
         9kRy8zvalDRj9DiH/sRJ1TIww5tt0/dHox9OudodSRt3uBwN++rpHzYuQG7QJGRi/7kO
         4SCQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>, Ivan Shapovalov <intelfx100@gmail.com>

This is a multi-part message in MIME format.
--------------090105010504010402030503
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

--------------090105010504010402030503
Content-Type: text/x-patch;
 name="reiser4-fix-compile-errors-when-debug-is-on.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fix-compile-errors-when-debug-is-on.patch"

---
 fs/reiser4/discard.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -123,7 +123,7 @@ int discard_atom(txn_atom *atom, struct
 	}
 
 	assert("intelfx-28", atom != NULL);
-	assert("intelfx-59", processed_entries != NULL);
+	assert("intelfx-59", processed_set != NULL);
 
 	if (list_empty(&atom->discard.delete_set)) {
 		/* Nothing left to discard. */
@@ -156,7 +156,7 @@ int discard_atom(txn_atom *atom, struct
 void discard_atom_post(txn_atom *atom, struct list_head *processed_set)
 {
 	assert("intelfx-60", atom != NULL);
-	assert("intelfx-61", processed_entries != NULL);
+	assert("intelfx-61", processed_set != NULL);
 
 	if (!reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
 		spin_unlock_atom(atom);

--------------090105010504010402030503--
