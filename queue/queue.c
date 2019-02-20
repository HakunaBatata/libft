/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   queue.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: skunz <skunz@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/02/19 22:33:10 by skunz             #+#    #+#             */
/*   Updated: 2019/02/20 11:43:13 by skunz            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "queue.h"

t_queue	*init_queue(void)
{
	t_queue *queue;

	if (!(queue = malloc(sizeof(t_queue))))
		return (NULL);
	queue->first = NULL;
	queue->last = NULL;
	return (queue);
}

void	enqueue(t_queue *queue, void *content, size_t content_size)
{
	t_list *new;

	if (queue == NULL)
		return ;
	new = ft_lstnew(content, content_size);
	new->next = NULL;
	new->content = content;
	if (queue->first == NULL)
		queue->first = new;
	else
		queue->last->next = new;
	queue->last = new;
}

void	*dequeue(t_queue *queue)
{
	void *content;

	if (queue && queue->first)
	{
		content = queue->first->content;
		free(queue->first);
		queue->first = queue->first->next;
		return (content);
	}
	return (NULL);
}

void	*front(t_queue *queue)
{
	if (queue && queue->first)
		return (queue->first->content);
	return (NULL);
}

int		is_empty(t_queue *queue)
{
	return (!queue || !queue->first);
}
