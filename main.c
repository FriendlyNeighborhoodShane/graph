// Main file with main routine

#include "commit.h"
#include "config.h"
#include "graph.h"
#include "revision.h"

int main(void) {

    struct rev_info *opts;
    struct commit *commit;
    struct git_graph *graph = graph_init(opts);
 
    while ((commit = get_revision(opts)) != NULL) {
    	while (!graph_is_commit_finished(graph))
    	{
    		struct strbuf sb;
    		int is_commit_line;
 
    		strbuf_init(&sb, 0);
    	  	is_commit_line = graph_next_line(graph, &sb);
    		fputs(sb.buf, stdout);
 
    		if (is_commit_line)
    	  		log_tree_commit(opts, commit);
    		else
    			putchar(opts->diffopt.line_termination);
    	}
    }

}
